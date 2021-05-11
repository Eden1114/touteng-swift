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
    @Published var response_extra: [PostListCategory:String] = [
        .all:"",
        .military:"",
        .tech:"",
        .entertainment:""
    ]

    @Published var reloadData:Bool = false
    @Published var isRefreshing:Bool = false
    @Published var isLoadingMore:Bool = false
    @Published var hasMore:Bool = true
    @Published var loadingError: Error?
    
    @Published var postlists:[PostListCategory:[Article]] = [
        .all:[],
        .military:[],
        .tech:[],
        .entertainment:[],
    ]
    
    @Published var postlistsSet:[PostListCategory:Set<GID>] = [
        .all:Set<GID>(),
        .military:Set<GID>(),
        .tech:Set<GID>(),
        .entertainment:Set<GID>()
    ]
    
}





extension UserData {
    static let testData: UserData = {
        let data = UserData()
        let list_dir = "list.json"
//        let adinfo_dir = "adinfo.json"
        let listJson:ArticleListResponse = Utils.loadJsonData(list_dir)
        data.handleRefresh(articleListResponse: listJson, forCategory: .all)
        data.handleRefresh(articleListResponse: listJson, forCategory: .military)
        data.handleRefresh(articleListResponse: listJson, forCategory: .tech)
        data.handleRefresh(articleListResponse: listJson, forCategory: .entertainment)
        return data
    }()
    
    
    var showLoadingError: Bool { loadingError != nil }
    var loadingErrorText: String { loadingError?.localizedDescription ?? "" }
    
    func refresh(forCategory: PostListCategory) {
        if self.isRefreshing { return }
        
        NetworkAPI.getList(parameters:
                            ["category":forCategory.rawValue,
                             "request_type": RequestType.refresh.rawValue,
                             "response_extra":response_extra[forCategory]!]) {result in
            switch result {
                case let .success(articleListResponse):
                    self.handleRefresh(articleListResponse: articleListResponse, forCategory:forCategory)
                    self.handleExtra(forCategory: forCategory, extra: articleListResponse.extra)
                    self.handleHasMore(forCategory: forCategory, articleListResponse: articleListResponse)
                case let .failure(error):
                    self.handleLoadingError(error)
            }
            self.isRefreshing = false
        }
    }
    
    private func handleRefresh(articleListResponse:ArticleListResponse, forCategory:PostListCategory) {
        var tempList: [Article] = []
        var tempSet = Set<GID>()
        
        for article in articleListResponse.data {
            if tempSet.contains(article.gid) { continue }
            tempSet.insert(article.gid)
            tempList.append(article)
//            update(article)
        }
        self.postlists[forCategory] = tempList
        self.postlistsSet[forCategory] = tempSet
    }
    
    func loadMore(forCategory: PostListCategory) {
        if self.isLoadingMore {
            return
        } else if !self.hasMore {
            self.loadingError = NSError(domain: "HasMore",code: 201, userInfo: [NSLocalizedDescriptionKey : "No More Data"])
            return
        }
        self.isLoadingMore = true
        
        NetworkAPI.getList(parameters:
                            ["category":forCategory.rawValue,
                             "request_type": RequestType.loadingMore.rawValue,
                             "response_extra":response_extra[forCategory]!]) {result in
            switch result {
                case let .success(articleListResponse):
                    self.handleLoadMore(articleListResponse: articleListResponse, forCategory:forCategory)
                    self.handleExtra(forCategory: forCategory, extra: articleListResponse.extra)
                    self.handleHasMore(forCategory: forCategory, articleListResponse: articleListResponse)
                case let .failure(error):
                    self.handleLoadingError(error)
                    
            }
            self.isLoadingMore = false
        }
    }
    
    private func handleHasMore(forCategory: PostListCategory, articleListResponse:ArticleListResponse) {
        self.hasMore = articleListResponse.has_more ?? true
        if (self.postlists[.all]!.count == 71) {
            self.hasMore = false
        }
    }
    
    private func handleLoadMore(articleListResponse:ArticleListResponse, forCategory:PostListCategory) {
        for article in articleListResponse.data {
            
            if self.postlistsSet[forCategory]!.contains(article.gid) {
                continue
            } else {
                self.postlistsSet[forCategory]!.insert(article.gid)
                debugPrint(self.postlists[forCategory]!.count)
                self.postlists[forCategory]!.append(article)
                debugPrint(self.postlists[forCategory]!.count)
            }
        }
    }
    
    func loadArticleIfNeeded(forCategory:PostListCategory)  {
        if self.postlists[forCategory]!.isEmpty {
            refresh(forCategory: forCategory)
        }
    }

    private func handleLoadingError(_ error:Error) {
        self.loadingError = error
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.loadingError = nil
        }
    }
    
    private func handleExtra(forCategory: PostListCategory, extra: String?) {
        self.response_extra[forCategory] = extra ?? ""
    }
}

