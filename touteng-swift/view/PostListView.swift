//
//  PostListView.swift
//  touteng-swift
//
//  Created by Eden on 2021/5/6.
//

import SwiftUI
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
        let articles = userData.postlists[.all]!
        return NavigationView {
//            List {
//                ForEach(articles) { article in
//                    ZStack {
//                        ArticleView(article: article)
//                        NavigationLink(destination: FullArticleView(webViewStore: userData.webviewstore, url: article.article_url)
//                        ) {
//                            EmptyView()
//                        }.hidden()
//                    }
//                }
//            }
            BBTableView(articles) { article in
                NavigationLink(destination:FullArticleView(webViewStore: userData.webviewstore, url: article.article_url)) {
                    ArticleView(article: article)
                }
                .buttonStyle(OriginalButtonStyle())
            }
            .bb_setupRefreshControl { control in
                control.attributedTitle = NSAttributedString(string: "loading")
            }
            .bb_pullDownToRefresh(isRefreshing: $userData.isRefreshing) {
                print("refresh")
                self.userData.loadingError = NSError(domain: "", code: 123, userInfo: [NSLocalizedDescriptionKey:"refreshing error"])
            }
            .bb_pullUpToLoadMore(bottomSpace: 30) {
                if self.userData.isLoadingMore { return }
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
            
            
            .navigationBarTitle(category.rawValue)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(category: .all).environmentObject(UserData())
    }
}
