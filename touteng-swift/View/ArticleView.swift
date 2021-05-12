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
    
    var body: some View {
        ZStack {
            if article.cell_type == 0 {
                VStack(alignment:.leading, spacing:10) {
                    // title
                    Text(article.gid)
                    Text(article.title)
                        .font(.system(size: 20))
                        .padding(.horizontal,5)
                    
                    HStack(alignment:.center, spacing:3) {
                        ForEach(article.covers ?? []) { cover in
                            ZStack {
                                WebImage(url: cover.Url)
                                    .resizable()
                                    .frame(width: 96, height: 63)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                            }
                        }
                    }
                    
                    HStack(alignment:.bottom) {
                        if article.author_info != nil {
                            AuthorView(author: article.author_info!)
                        }
                        Text(article.time)
                            .font(.system(size: 13))
                    }
                }
            } else {
                BannerView(category: category).environmentObject(userData)
            }
        }
    }
}


struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        let article:Article = UserData.testData.postlists[.all]![0]
        ArticleView(article: article, category: .all).environmentObject(UserData.testData)
    }
}
