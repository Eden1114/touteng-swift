//
//  Article.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/22.
//

import SwiftUI
import SDWebImageSwiftUI


struct ArticleView: View {
    @EnvironmentObject var userData:UserData
    
    var article:Article
    var category:PostListCategory
    let scrwidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            //rectangle
            Rectangle()
                .padding(.horizontal,-5)
                .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255))
                .frame(height:5)
            
            if article.cell_type == 0 {
                
                if (article.covers?.count == 0){
                    VStack(alignment:.leading, spacing:10) {
                        // title
                        Text(article.title)
                            .font(.system(size: 20))
                            .frame(width:(scrwidth-10),alignment:.leading)
                        //author
                        HStack(alignment:.bottom) {
                            if article.author_info != nil {
                                AuthorView(author: article.author_info!)
                            }
                            Text(article.time)
                                .font(.system(size: 12))
                                .foregroundColor(Color(red: 160/255, green: 160/255, blue: 160/255))
                        }
                    }
//                    .padding(.horizontal,5)
                    
                } else if (article.covers?.count == 1){
                    HStack(alignment:.center){
                        VStack(alignment:.leading){
                            // title
                            Text(article.title)
                                .font(.system(size: 20))
                                .frame(alignment:.leading)
                            //author
                            HStack(alignment:.bottom) {
                                if article.author_info != nil {
                                    AuthorView(author: article.author_info!)
                                }
                                Text(article.time)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(red: 160/255, green: 160/255, blue: 160/255))
                            }
                        }
                        Spacer()
                        // covers
                        ZStack {
                            WebImage(url: article.covers?[0].Url)
                                .resizable()
                                .frame(width: 100, height: 100*196/300)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                    }
                    .frame(width:(scrwidth-10))
//                    .padding(.horizontal,5)
                    
                }else if (article.covers?.count == 2){
                    VStack(alignment:.leading, spacing:10) {
                        // title
                        Text(article.title)
                            .font(.system(size: 20))
                            .frame(width:(scrwidth-10),alignment:.leading)
                        // covers
                        HStack(alignment:.center, spacing:3) {
                            ForEach(article.covers ?? []) { cover in
                                ZStack {
                                    WebImage(url: cover.Url)
                                        .resizable()
                                        .frame(width: (scrwidth-13)/2, height: 196*(scrwidth-13)/600)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                }
                            }
                        }
                        //author
                        HStack(alignment:.bottom) {
                            if article.author_info != nil {
                                AuthorView(author: article.author_info!)
                            }
                            Text(article.time)
                                .font(.system(size: 12))
                                .foregroundColor(Color(red: 160/255, green: 160/255, blue: 160/255))
                        }
                    }
                    .frame(width:(scrwidth-10))
//                    .padding(.horizontal,5)

                }else{
                    VStack(alignment:.leading, spacing:10) {
                        // title
                        Text(article.title)
                            .font(.system(size: 20))
                            .frame(alignment:.leading)
                        // covers
                        HStack(alignment:.center, spacing:3) {
                            ForEach(article.covers ?? []) { cover in
                                ZStack {
                                    WebImage(url: cover.Url)
                                        .resizable()
                                        .frame(width: (scrwidth-16)/3, height: 196*(scrwidth-16)/900)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                }
                            }
                        }
                        //author
                        HStack(alignment:.bottom) {
                            if article.author_info != nil {
                                AuthorView(author: article.author_info!)
                            }
                            Text(article.time)
                                .font(.system(size: 12))
                                .foregroundColor(Color(red: 160/255, green: 160/255, blue: 160/255))
                        }
                    }
                    .frame(width:(scrwidth-10))
//                    .padding(.horizontal,5)
                }
            } else {
                VStack {
                    BannerView(category: category).environmentObject(userData)
                }
//                .padding(.horizontal,5)
            }
            
            //rectangle
            Rectangle()
                .padding(.horizontal,-5)
                .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255))
                .frame(height:5)
        }
        .padding(.horizontal,5)
    }
}


struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        let article:Article = UserData.testData.postlists[.all]![1]
        ArticleView(article: article, category: .all).environmentObject(UserData.testData)
    }
}
