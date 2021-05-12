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
    case refresh = "1"
    case loadingMore = "2"
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
    
    
    @Published var allposts:[Article] = []
    
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
        let listJson:ArticleListResponse = Utils.loadJsonData(list_dir)
        data.handleRefresh(forCategory: .all, articleListResponse: listJson)
        data.handleRefresh(forCategory: .military, articleListResponse: listJson)
        data.handleRefresh(forCategory: .tech, articleListResponse: listJson)
        data.handleRefresh(forCategory: .entertainment, articleListResponse: listJson)
        return data
    }()
    
    
    var showLoadingError: Bool { loadingError != nil }
    var loadingErrorText: String { loadingError?.localizedDescription ?? "" }
    
    func refresh(forCategory: PostListCategory) {
        NetworkAPI.getList(parameters:
                            ["category":forCategory.rawValue,
                             "request_type": RequestType.refresh.rawValue,
                             "response_extra":response_extra[forCategory]!]) {result in
            switch result {
                case let .success(articleListResponse):
                    self.handleRefresh(forCategory:forCategory, articleListResponse: articleListResponse)
                    self.handleExtra(forCategory: forCategory, extra: articleListResponse.extra)
                    self.handleHasMore(forCategory: forCategory, articleListResponse: articleListResponse)
                case let .failure(error):
                    self.handleLoadingError(error)
            }
            self.isRefreshing = false
        }
    }
    
    private func handleRefresh(forCategory:PostListCategory, articleListResponse:ArticleListResponse) {
        var tempList: [Article] = []
        var tempSet = Set<GID>()
        
        for article in articleListResponse.data {
            if tempSet.contains(article.gid) { continue }
            tempSet.insert(article.gid)
            tempList.append(article)
        }
        self.postlists[forCategory] = tempList
        self.postlistsSet[forCategory] = tempSet
    }
    
    func loadMore(forCategory: PostListCategory) {
        if self.isLoadingMore {
            return
        } else if !self.hasMore {
            self.loadingError = NSError(domain: "HasMore",code: 201, userInfo: [NSLocalizedDescriptionKey : "真头疼，没得更多新闻了"])
            return
        }
        self.isLoadingMore = true
        
        NetworkAPI.getList(parameters:
                            ["category":forCategory.rawValue,
                             "request_type": RequestType.loadingMore.rawValue,
                             "response_extra":response_extra[forCategory]!]) { result in
            switch result {
                case let .success(articleListResponse):
                    self.handleLoadMore(forCategory:forCategory, articleListResponse: articleListResponse)
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
    
    private func handleLoadMore(forCategory:PostListCategory, articleListResponse:ArticleListResponse) {
        var tempList: [Article] = []
        var tempSet = Set<GID>()
        
        for article in articleListResponse.data {
            if !self.postlistsSet[forCategory]!.contains(article.gid) {
                self.postlistsSet[forCategory]!.insert(article.gid)
                self.postlists[forCategory]!.append(article)
            }
        }
    }
    
    func loadArticleIfNeeded(forCategory:PostListCategory)  {
        if self.postlists[forCategory]!.isEmpty {
            self.refresh(forCategory: forCategory)
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

