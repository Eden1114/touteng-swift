//
//  Article.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/22.
//

import SwiftUI

struct ArticleView: View {
    
    @State var article:Article
    
    var body: some View {
        VStack {
            Text(article.title)
            HStack {
                Text("123")
//                AuthorView(author :article.author)
//                 parse Image
                // parse Timestamp
                //
            }
        }
    }
}

struct Article_Previews: PreviewProvider {
    static var previews: some View {
        Text("123")
//        var file = JSONSerialization.jsonObject(with: ), options: JSONSerialization.ReadingOptions)
//        var article: Article = JSONDecoder().decode(PostList.self, from: json)
//        ArticleView(article: article)
    }
}
