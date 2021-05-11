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
    @State var category:PostListCategory
    
    var body: some View {
        ZStack {
            if article.cell_type == 0 {
                VStack(alignment:.leading, spacing:10) {
                    // title
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
                        AuthorView(author: article.author_info ?? Author(avatar: "https://p1-tt-ipv6.byteimg.com/img/web.business.image/202104185d0d4bebe7a42da34d06a7ca~tplv-tt-cs0:960:540.image?from=feed", user_name: "Advertisement"))
                        Text(article.time)
                        .font(.system(size: 13))
                    }
                }
            } else {
                BannerView(category: category)
            }
        }
    }
}


struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        let article:Article = UserData.testData.postlists[.all]![9]
        ArticleView(article: article, category: .all)
    }
}
