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
        return VStack {
            BBTableView(userData.postlists[category]!) { article in
                NavigationLink(destination:FullArticleView(url: article.article_url)) {
                    ArticleView(article: article, category: category)
                }
                .buttonStyle(OriginalButtonStyle())
            }
            .bb_reloadData($userData.reloadData)
            .bb_pullDownToRefresh(isRefreshing: $userData.isRefreshing) {
                self.userData.refresh(forCategory: category)
            }
            .bb_setupRefreshControl { control in
                control.attributedTitle = NSAttributedString(string: "数据搬运中～")
            }
            .bb_pullUpToLoadMore(bottomSpace: 30) {
                self.userData.loadMore(forCategory: category)
            }
            
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
