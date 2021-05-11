//
//  Article.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/22.
//

import SwiftUI
import SDWebImageSwiftUI


struct ArticleView: View {
    
    @State var article:Article
    
    var body: some View {
        
//        if (article.covers.count == 0) {
//            VStack(alignment:.leading) {
//                Text(article.title)
//                    .font(.subheadline)
//                HStack {
//                    AuthorView(author: article.author_info)
//                    Text(article.getPublishTimeString())
//                        .font(.caption2)
//                }
//            }.onTapGesture(perform: {
//                // TODO
//            })
//        } else if (article.covers.count == 1) {
//            VStack{
//                HStack(alignment:.center,spacing:15) {
//                    VStack(alignment:.leading){
//                        Text(article.title).font(.subheadline)
//                        HStack{
//                            AuthorView(author: article.author_info)
//                            Text(article.getPublishTimeString()).font(.caption2)
//                        }
//                    }
////                    URLImageView(url: article.covers[0].url)
//
//                    WebImage(url: article.covers[0].Url)
//                        .frame(width: 110, height: 72, alignment: .leading)
//                }.padding(.horizontal,5)
//            }
//            .onTapGesture(perform: {
//                // TODO
//            })
//        } else if (article.covers.count == 2){
//            VStack(alignment:.leading,spacing:10) {
//                Text(article.title)
//                    .font(.subheadline)
//                    .padding(.horizontal,5)
//                VStack (alignment:.leading,spacing:8){
//                    HStack(alignment:.center,spacing:3) {
//                        ForEach(article.covers.indices, id: \.self) { index in
//                            WebImage(url: article.covers[0].Url)
//                                .placeholder { Color.gray }
//                                .frame(width: 110, height: 72, alignment: .leading)
//                                .frame(width: 144, height: 94, alignment: .leading)
//                                .clipShape(RoundedRectangle(cornerRadius: 5))
//
//                        }
//                    }
//                    .frame(alignment:.leading)
//                    .padding(.horizontal, 5)
//                    HStack(alignment:.bottom) {
//                        AuthorView(author: article.author_info)
//                        Text(article.getPublishTimeString()).font(.system(size: 10))
//                    }.padding(.horizontal,5)
//
//                }.onTapGesture(perform: {
//                    // TODO
//                })
//            }
//        } else {
            VStack(alignment:.leading,spacing:10) {
                Text(article.title)
                    .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal,5)
                
                VStack (alignment:.leading, spacing:8) {
                    HStack(alignment:.center, spacing:3) {
                        ForEach(article.covers ?? []) { cover in
                            WebImage(url: cover.Url)
                                .resizable()
                                .frame(width: 96, height: 63, alignment: .leading)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                    }
                    .frame(alignment:.leading)
                    .padding(.horizontal,4)
                    
                    HStack(alignment:.bottom) {
                        AuthorView(author: article.author_info ?? Author(avatar: "https://p1-tt-ipv6.byteimg.com/img/web.business.image/202104185d0d4bebe7a42da34d06a7ca~tplv-tt-cs0:960:540.image?from=feed", user_name: "Advertisement"))
                        
                        Text(article.time)
                            .font(.system(size: 10))
                    }
                    .padding(.horizontal, 4)
                }.onTapGesture(perform: {
                    // TODO
                })
            }
//        }
    }
}
