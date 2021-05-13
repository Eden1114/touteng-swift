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
    let scrwidth = UIScreen.main.bounds.width
    
    var body: some View {
        WebImage(url: article.covers![0].Url)
            .placeholder {
                Color.gray
            }
            .resizable()
            .frame(width: (scrwidth-10), height: (scrwidth-10)*196/300, alignment: .leading)
            .aspectRatio(3/2,contentMode: .fit)
            .overlay(TextOverlay(title: article.title))
    }
}

struct BannerView: View {
    @EnvironmentObject var userData:UserData
    @State var currentPage = 0
    @State var category:PostListCategory
    let scrwidth = UIScreen.main.bounds.width
    
    var body: some View {
        let pages:[BannerImage] = {
            var pages:[BannerImage] = []
            
            // 最多1个广告
            for article in userData.postlists[self.category] ?? [] {
                if pages.count > 2 {
                    break
                }
                if article.cell_type == 1
                    && article.covers != nil
                    && article.covers![0].url_large != "" {
                    pages.append(BannerImage(article: article))
                }
            }
            
            // 4个banner
            for article in userData.postlists[self.category] ?? [] {
                if pages.count > 4 {
                    break
                }
                if article.cell_type == 0
                   && article.covers != nil
                   && article.covers![0].url_large != "" {
                    pages.append(BannerImage(article: article))
                }
            }
            
            
            
            return pages
        }()
        
        ZStack(alignment: .bottomTrailing) {
            if pages.count != 0 {
                VStack{
                    ZStack(alignment: .bottomTrailing){
                        PageViewController(pages: pages, currentPage: $currentPage)
                        PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                            .frame(width: CGFloat(pages.count * 18))
                            .padding(.trailing)
                    }
                    
                }
                .frame(width: (scrwidth-10), height: (scrwidth-10)*196/300)
            }
        }
//        .frame(minHeight: 100)
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView(category: .all).environmentObject(UserData.testData)
    }
}


