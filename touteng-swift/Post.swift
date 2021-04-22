//
//  post.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/22.
//

import Foundation


// data model

struct Author {
    let name:String
    let avatar:String
}

struct CoverImage: Codable {
    let width: Int
    let height: Int
    let url: String
    let url_large: String
}

struct Article: Decodable {
    let cell_type: Int
    let publish_time: Int
    let gid: String
    let title: String
    let article_url: String
    var covers: [CoverImage]
}

struct Advertisement: Decodable {
    let gid: String
    let cell_type: Int
    let title: String
    let article_url: String
    var covers: [CoverImage]
}
