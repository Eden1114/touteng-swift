//
//  Model.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/22.
//

import Foundation


struct Author: Codable {
    let avatar:String
    let user_name:String
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
    let author_info: Author
    let publish_time: Int?
    let covers: [CoverImage]
}

extension Article:Codable, Identifiable, Equatable {
    var id: String {
        return gid
    }
    
    func getPublishTimeString() -> String {
        return Utils.getStringFromTimeStamp(self.publish_time ?? 0)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.gid == rhs.gid
    }
}

struct Advertisement {
    let gid: String
    let cell_type: Int
    let title: String
    let article_url: String
    let covers: [CoverImage]
}

extension Advertisement:Codable, Identifiable {
    var id: String {
        return gid
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

struct AdvertisementResponse: Codable {
    let code: Int
    let message: String
    let data: Advertisement
}


func loadJsonData<T: Decodable> (_ fileName: String) -> T {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Can not find \(fileName) in main bundle")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Can not load \(url)")
    }
    guard let t = try? JSONDecoder().decode(T.self, from: data) else {
        fatalError("Can not parse json data")
    }
    return t
}
