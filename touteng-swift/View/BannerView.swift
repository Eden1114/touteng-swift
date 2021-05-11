//
//  Banner.swift
//  touteng-swift
//
//  Created by cqs on 2021/5/9.
//  single banner

import SwiftUI
import SDWebImageSwiftUI



struct TextOverlay: View {
    var title: String

    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .bold()
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct BannerImage: View {
    @State var article:Article
    
    var body: some View {
        VStack(alignment:.leading) {
            WebImage(url: article.covers![0].Url_large)
                .placeholder {
                    Color.gray
                }
                .resizable()
                .frame(width: 300, height: 196, alignment: .leading)
                .aspectRatio(3/2,contentMode: .fit)
                .overlay(TextOverlay(title: article.title))
        }.padding(.horizontal)
    }
}

struct BannerView: View {
    @EnvironmentObject var userData:UserData
    @State var currentPage = 0
    @State var category:PostListCategory
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            let pages:[BannerImage] = {
                var pages:[BannerImage] = []
                for article in userData.postlists[category] ?? [] {
                    if pages.count > 3 {
                        break
                    }
                    if article.covers != nil {
                        pages.append(BannerImage(article: article))
                    }
                }
                return pages
            }()
            if pages.count != 0 {
                PageViewController(pages: pages, currentPage: $currentPage)
                PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                    .frame(width: CGFloat(pages.count * 18))
                    .padding()
            }
        }
    }


}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView(category: .all).environmentObject(UserData.testData)
    }
}


