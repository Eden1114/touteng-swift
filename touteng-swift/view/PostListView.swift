//
//  PostListView.swift
//  touteng-swift
//
//  Created by Eden on 2021/5/6.
//

import SwiftUI

struct PostListView: View {
    @EnvironmentObject var userData: UserData
    @State var category:PostListCategory
    
    var webviewstore = WebViewStore()
    
    
    var body: some View {
        let ps = userData.post(self.category)!
        return NavigationView {
            List {
                ForEach(ps.data.indices) { index in
                    ZStack {
                        ArticleView(article: ps.data[index])
                        
                        NavigationLink(destination: FullArticleView(webViewStore: self.webviewstore, url: ps.data[index].article_url)
                        ) {
                            EmptyView()
                        }.hidden()
                    }
                }
            }
            .navigationBarTitle("Bar title")
//            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(category: .all).environmentObject(UserData())
    }
}
