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
            
            Text("Cell Type:"+String(article.cell_type))
            
            Text(article.getPublishTimeString())
            
            
            if (article.cell_type == 1) {
                
            } else if (article.cell_type == 2) {
                
            } else {
                
            }
//            article.article_url
//            article.
            HStack {
                ForEach(article.covers.indices, id: \.self) { index in
                    URLImageView(url: article.covers[index].url)
                        .frame(width: 100, height: 80, alignment: .leading)
                }
            }
            
            HStack {
                AuthorView(author: article.author_info)
            }
            
        }.onTapGesture(perform: {
            // TODO
        })
    }
}

struct Article_Previews: PreviewProvider {
    static var previews: some View {
        let articleData:Data = """
        {"article_url":"https://m.toutiao.com/a6951333674851942950","author_info":{"avatar":"http://p1-dy.bytexservice.com/origin/pgc-image/acce69d4feb44235852525655ca958e0","user_name":"魏医生在线"},"cell_type":0,"covers":[{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/14eddd01aa824a8695e1833ca69b532c~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/14eddd01aa824a8695e1833ca69b532c~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/29f9742328484fe0bae682b6153854a8~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/29f9742328484fe0bae682b6153854a8~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/883f0619e414444a953b0f93823930c1~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/883f0619e414444a953b0f93823930c1~tplv-tt-shrink:1080:0.image?from=feed","width":300}],"gid":"6951333674851942950","publish_time":1618488177,"title":"脑梗来临，睡觉先知？医生提醒：睡觉出现“5个异常”，小心脑梗"}
        """.data(using: String.Encoding.utf8)!
        let article = try! JSONDecoder().decode(Article.self, from: articleData)
//        ArticleView(article: article)
        ArticleView(article: article)
    }
}
