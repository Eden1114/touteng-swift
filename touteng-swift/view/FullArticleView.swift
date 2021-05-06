//
//  FullArticleView.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/28.
//

import SwiftUI

struct FullArticleView: View {
    @StateObject var webViewStore = WebViewStore()
    @State var url = "https://apple.com"
    
    var body: some View {
        NavigationView {
          WebView(webView: webViewStore.webView)
            .navigationBarTitle(Text(verbatim: webViewStore.title ?? ""), displayMode: .inline)
            .navigationBarItems(trailing: HStack {
              Button(action: goBack) {
                Image(systemName: "chevron.left")
                  .imageScale(.large)
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 32, height: 32)
              }.disabled(!webViewStore.canGoBack)
              Button(action: goForward) {
                Image(systemName: "chevron.right")
                  .imageScale(.large)
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 32, height: 32)
              }.disabled(!webViewStore.canGoForward)
            })
        }.onAppear {
            self.webViewStore.webView.load(URLRequest(url: URL(string: self.url)!))
        }
      }
      
      func goBack() {
        webViewStore.webView.goBack()
      }
      
      func goForward() {
        webViewStore.webView.goForward()
      }
}

struct FullArticleView_Previews: PreviewProvider {
    static var previews: some View {
        FullArticleView()
    }
}
