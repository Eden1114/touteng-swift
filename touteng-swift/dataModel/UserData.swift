//
//  UserData.swift
//  touteng-swift
//
//  Created by Eden on 2021/5/8.
//

import Foundation
import Combine

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
    
    @Published var response_extra: [PostListCategory:String] = [
        .all:"",
        .military:"",
        .tech:"",
        .entertainment:""
    ]
    
    @Published var isRefreshing:Bool = false
    @Published var isLoadingMore:Bool = false
    @Published var loadingError: Error?
//    @Published var error: Error?
    
    @Published var postlists:[PostListCategory:[Article]] = [
        .all:[],
        .military:[],
        .tech:[],
        .entertainment:[],
    ]
    
    private var postlistDic:[PostListCategory:[String:Article]] = [
        .all:[:],
        .military:[:],
        .tech:[:],
        .entertainment:[:]
    ]
    
    @Published var ads: [Advertisement] = []
    
    private var adsDic: [String:Advertisement] = [:]
    
    private var postCount:Int = 0
    
    init() {
        self.loadAds()
        self.loadList(category: .all, request_type: .refresh)
        self.loadList(category: .military, request_type: .refresh)
        self.loadList(category: .tech, request_type: .refresh)
        self.loadList(category: .entertainment, request_type: .refresh)
    }
}





extension UserData {
    var showLoadingError: Bool { loadingError != nil }
    var loadingErrorText: String { loadingError?.localizedDescription ?? "" }
    
    func loadList(category:PostListCategory, request_type:RequestType) {
        NetworkAPI.getList(parameters:
                            ["category":category.rawValue,
                             "request_type": request_type.rawValue,
                             "response_extra":self.response_extra[category] ?? ""]) {result in
            switch result {
            case let .success(postlist):
                if request_type == .refresh {
                    self.postlists[category] = []
                    self.postlistDic[category] = [:]
                }
                
                for article in postlist.data {
                    if self.postlistDic[category]![article.gid] != nil { continue }
                    self.postlistDic[category]![article.gid] = article
                    self.postlists[category]!.append(article)
                }
                if request_type == .loadingMore {
                    debugPrint(123)
                }
                self.response_extra[category] = postlist.extra ?? ""
                
//                debugPrint("extra")
//                debugPrint(category)
//                debugPrint(self.response_extra[category] ?? "")
                
            case let .failure(error):
                self.handleLoadingError(error)
            }
        }
    }
    
    func loadAds() {
        NetworkAPI.getAdInfo(parameters: nil) {result in
            switch result {
            case let .success(ads):
                if self.adsDic[ads.data.gid] == nil {
                    self.adsDic[ads.data.gid] = ads.data
                    self.ads.append(ads.data)
                }
            case let .failure(error):
                self.handleLoadingError(error)
            }
        }
    }
    
    func handleInteraction(category:PostListCategory, requestType:RequestType) {
        switch requestType {
        case .refresh:
            self.loadList(category: category, request_type: requestType)
        case .loadingMore:
            if isLoadingMore { return }
            isLoadingMore = true
            self.loadList(category: category, request_type: requestType)
        }
        
        self.loadAds()
    }
    
    private func handleLoadingError(_ error:Error) {
        loadingError = error
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.loadingError = nil
        }
    }
}

