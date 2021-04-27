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

struct CoverImage: Codable {
    let width: Int  // 300
    let height: Int // 196
    let url: String
    let url_large: String
}

struct Article: Codable {
    let article_url: String
    let cell_type: Int
    let title: String
    let author_info: Author
    let publish_time: Int?
    let gid: String
    let covers: [CoverImage]
}

struct Advertisement: Codable {
    let gid: String
    let cell_type: Int
    let title: String
    let article_url: String
    let covers: [CoverImage]
}

struct PostList: Codable {
    let code: Int
    let message: String
    let data: [Article]
    let tips: String?
    let extra: String?
    var has_more: Bool?
}

struct AdvertisementList: Codable {
    let code: Int
    let message: String
    let data: Advertisement
//    let extra: String?
}
