//
//  FullArticleView.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/28.
//

import SwiftUI
import WebKit

struct FullArticleView: View {
    let url: String
    
    var body: some View {
        SwiftUIWKWebView(url: URL(string: url)!)
    }
}

struct SwiftUIWKWebView: UIViewRepresentable {
  var url: URL
  func makeUIView(context: Context) -> WKWebView {
    let request = URLRequest(url: url)
    let webview = WKWebView()
    webview.load(request)
    return webview
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    
  }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FullArticleView(url: "https://www.apple.com")
    }
}
