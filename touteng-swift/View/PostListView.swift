//
//  PostListView.swift
//  touteng-swift
//
//  Created by Eden on 2021/5/6.
//

import SwiftUI
import Combine
import BBSwiftUIKit


struct OriginalButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}


struct PostListView: View {
    @EnvironmentObject var userData: UserData
    @State var category:PostListCategory
    
    var body: some View {
        let articlelist = userData.postlists[category]!
        return VStack {
            BBTableView(articlelist) { article in
                NavigationLink(destination:FullArticleView(url: article.article_url)) {
//                    if(article) {
//                        VStack {
//                            BannerView(category: category)
//                            .aspectRatio(3 / 2, contentMode: .fit)
//                            ArticleView(article: article)
//                        }
//                    }
//                    else {
                        ArticleView(article: article, category: category)
//                    }
                }
                .buttonStyle(OriginalButtonStyle())
            }
            .bb_setupRefreshControl { control in
                control.attributedTitle = NSAttributedString(string: "Loading")
            }
            .bb_pullDownToRefresh(isRefreshing: $userData.isRefreshing) {
                self.userData.refresh(forCategory: category)
            }
            .bb_pullUpToLoadMore(bottomSpace: 30) {
                self.userData.loadMore(forCategory: category)
            }
            .bb_reloadData($userData.reloadData)
            .onAppear {
                self.userData.loadArticleIfNeeded(forCategory: category)
            }
            .overlay(
                Text(userData.loadingErrorText)
                    .bold()
                    .frame(width: 200)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .opacity(0.8)
                    )
                    .scaleEffect(userData.showLoadingError ? 1: 0.5)
                        .animation(.spring(dampingFraction: 0.5))
                    .opacity(userData.showLoadingError ? 1 : 0)
                        .animation(.easeInOut)
            )
            .listRowInsets(EdgeInsets())
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(category: .all).environmentObject(UserData.testData)
    }
}
