//
//  UserData.swift
//  touteng-swift
//
//  Created by Eden on 2021/5/8.
//

import Combine

let list_dir = "list.json"
let ad_dir = "ad.json"

class UserData: ObservableObject {
    @Published var response_extra: String = ""

    @Published var all_postlists:PostList = loadJsonData(list_dir)
    
//    @Published var postlists:[PostListCategory:PostList] = [
//        .all:loadJsonData(list_dir),
//        .military:loadJsonData(list_dir),
//        .entertainment :loadJsonData(list_dir),
//        .tech: loadJsonData(list_dir)
//    ]
    
    @Published var ads: AdvertisementList = loadJsonData(ad_dir)
    @Published var error: Error? = nil
    
    init() {
        
        
    }
}


enum PostListCategory:String {
    case all = "all"
    case military = "military"
    case entertainment = "entertainment"
    case tech = "tech"
}


extension UserData {
    
    func loadList(category:PostListCategory, request_type:String) {
        NetworkAPI.getList(parameters:
                            ["category":category.rawValue,
                            "request_type": request_type,
                            "response_extra":self.response_extra]) {result in
            switch result {
            case let .success(postlist):
//                self.postlists[category] = postlist
                self.all_postlists = postlist
            case let .failure(error):
                self.error = error
                debugPrint(error)
            }
        }
    }
    
    func loadAds() {
        NetworkAPI.getAdInfo(parameters: nil) {result in
            switch result {
            case let .success(ads):
                self.ads = ads
            case let .failure(error):
                self.error = error
                debugPrint(error)
            }
        }
    }
    
    
    func post(_ category: PostListCategory) -> PostList? {
//        return self.postlists[category]
        switch category {
            case .all:
                return self.all_postlists
            default:
                return nil
        }
        
    }
    
}

