//
//  UserData.swift
//  touteng-swift
//
//  Created by Eden on 2021/5/8.
//

import Combine

let list_dir = "list.json"
let ad_dir = "ad.json"

enum PostListCategory:String {
    case all = "all"
    case military = "military"
    case entertainment = "entertainment"
    case tech = "tech"
}

enum RequestType:String {
    case refresh = "1"  // 下拉刷新
    case loadingMore = "2" // 加载更多
}

class UserData: ObservableObject {
    var webviewstore = WebViewStore() // for WebView
    
    @Published var response_extra: String = ""
    @Published var isRefreshing:Bool = false
    @Published var isLoadingMore:Bool = false
    @Published var loadingError: Error?
    @Published var error: Error?
    @Published var postlists:[PostListCategory:[Article]] = [
        .all:[],
        .military:[],
        .tech:[],
        .entertainment:[],
    ]
    
    @Published var ads: [Advertisement] = []
    
    
    private var postCount:Int = 0
    
    init() {
        let listJson:ArticleListResponse = loadJsonData(list_dir)
        postlists[.all] = listJson.data
        self.loadAds()
        self.loadList(category: .all, request_type: "1")
        self.loadList(category: .military, request_type: "1")
        self.loadList(category: .tech, request_type: "1")
        self.loadList(category: .entertainment, request_type: "1")
    }
}





extension UserData {
    var showLoadingError: Bool { loadingError != nil }
    var loadingErrorText: String { loadingError?.localizedDescription ?? "" }
    
    
    func loadList(category:PostListCategory, request_type:String) {
        NetworkAPI.getList(parameters:
                            ["category":category.rawValue,
                            "request_type": request_type,
                            "response_extra":self.response_extra]) {result in
            switch result {
            case let .success(postlist):
                for article in postlist.data {
                    self.postlists[category]?.append(article)
                }
            case let .failure(error):
                self.error = error
//                debugPrint(error)
            }
        }
    }
    
    func loadAds() {
        NetworkAPI.getAdInfo(parameters: nil) {result in
            switch result {
            case let .success(ads):
                self.ads.append(ads.data)
            case let .failure(error):
                self.error = error
            }
        }
    }
    
    
    func getArticle(category: PostListCategory, requestType:RequestType) {
        NetworkAPI.getList(parameters:
                            ["category":category.rawValue,
                            "request_type": requestType.rawValue,
                            "response_extra":self.response_extra]) {result in
            switch result {
            case let .success(postlist):
                for article in postlist.data {
                    self.postlists[category]?.append(article)
                }
            case let .failure(error):
                self.error = error
//                debugPrint(error)
            }
        }
        
        // TODO
//        NetworkAPI.getAdInfo(parameters: nil)
        
        
    }
    
    
}

