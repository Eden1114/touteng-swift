//
//  Model.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/22.
//

import Foundation


struct Author: Codable {
    let avatar:String // can be ""
    let user_name:String // 
}

extension Author {
    var avatar_url : URL {
        return URL(string: Utils.http2https(avatar))!
    }
}

struct CoverImage {
    let width: Int  // 300
    let height: Int // 196
    let url: String
    let url_large: String
}

extension CoverImage:Codable,Identifiable {
    var id: String {
        url
    }
    
    var Url:URL {
        return URL(string: Utils.http2https(url))!
    }
    
    var Url_large: URL {
        return URL(string: Utils.http2https(url_large))!
    }
}

struct Article {
    let gid: String
    let article_url: String
    let cell_type: Int
    let title: String
    let author_info: Author?
    let publish_time: Int?
    let covers: [CoverImage]?
}

extension Article:Codable, Identifiable, Equatable {
    
    var id: String {
        return gid
    }
    
    var time:String {
        if cell_type == 0 {
            return Utils.getStringFromTimeStamp(self.publish_time ?? 0)
        } else {
            return "Advertisement"
        }
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.gid == rhs.gid
    }
}

struct ArticleListResponse: Codable {
    let code: Int
    let message: String
    let data: [Article]
    let tips: String?
    let extra: String?
    let has_more: Bool?
}

typealias Advertisement = Article

struct AdvertisementResponse: Codable {
    let code: Int
    let message: String
    let data: Advertisement
}


typealias GID = String
