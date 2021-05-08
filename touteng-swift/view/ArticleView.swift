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
        
        if (article.covers.count == 0){
            VStack(alignment:.leading){
                Text(article.title).font(.subheadline)
                HStack{
                    AuthorView(author: article.author_info)
                    Text(article.getPublishTimeString()).font(.caption2)
                }
            }.onTapGesture(perform: {
                // TODO
            })
        }else if (article.covers.count == 1){
            VStack{
                HStack(alignment:.center,spacing:15){
                    VStack(alignment:.leading){
                        Text(article.title).font(.subheadline)
                        HStack{
                            AuthorView(author: article.author_info)
                            Text(article.getPublishTimeString()).font(.caption2)
                        }
                    }
                    URLImageView(url: article.covers[0].url)
                        .frame(width: 110, height: 72, alignment: .leading)
                }.padding(.horizontal,5)
            }
            .onTapGesture(perform: {
                // TODO
            })
        }else if (article.covers.count == 2){
            VStack(alignment:.leading,spacing:10) {
                Text(article.title)
                    .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal,5)
                VStack (alignment:.leading,spacing:8){
    //                Text(article.title)
    //                    .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
    //                    .padding(.horizontal, 12)
                    HStack(alignment:.center,spacing:3) {
                        ForEach(article.covers.indices, id: \.self) { index in
                            URLImageView(url: article.covers[index].url)
                                .frame(width: 144, height: 94, alignment: .leading).clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                    }
                    .frame(alignment:.leading)
                    .padding(.horizontal, 5)
                    
                    HStack(alignment:.bottom) {
                        AuthorView(author: article.author_info)
                            
                        //Image(“801620370787_.pic_hd”)
                        Text(article.getPublishTimeString()).font(.system(size: 10))
                    }.padding(.horizontal,5)
                    
                }.onTapGesture(perform: {
                    // TODO
                })
            }
        }else {
            VStack(alignment:.leading,spacing:10) {
                Text(article.title)
                    .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal,5)
                VStack (alignment:.leading,spacing:8){
    //                Text(article.title)
    //                    .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
    //                    .padding(.horizontal, 12)
                    HStack(alignment:.center,spacing:3) {
                        ForEach(article.covers.indices, id: \.self) { index in
                            URLImageView(url: article.covers[index].url)
                                .frame(width: 96, height: 63, alignment: .leading).clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                    }
                    .frame(alignment:.leading)
                    .padding(.horizontal,4)
                    
                    HStack(alignment:.bottom) {
                        AuthorView(author: article.author_info)
                            
                        //Image(“801620370787_.pic_hd”)
                        Text(article.getPublishTimeString()).font(.system(size: 10))
                    }.padding(.horizontal,4)
                    
                }.onTapGesture(perform: {
                    // TODO
                })
            }
        }
//        VStack (alignment:.leading){
//            Text(article.title)
//                .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
//
////            Text("Cell Type:"+String(article.cell_type))
//
////            Text(article.getPublishTimeString())
//
//            if (article.covers.count == 0){
//
//            } else if (article.covers.count == 1){
//                URLImageView(url: article.covers[0].url)
//                    .frame(width: 180, height: 80, alignment: .center)
//            } else{
//                HStack(alignment:.center) {
//                    ForEach(article.covers.indices, id: \.self) { index in
//                        URLImageView(url: article.covers[index].url)
//                            .frame(width: 90, height: 80, alignment: .leading)
//                    }
//                }.padding(.horizontal, 12)
//                .frame(alignment:.leading)
//
//            }
////            article.article_url
////            article.
//
//
//            HStack() {
//                AuthorView(author: article.author_info)
//                Text(article.getPublishTimeString()).font(.footnote)
//            }
            
//        }.onTapGesture(perform: {
//            // TODO
//        })
//        .padding(.horizontal, 12.0)
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
