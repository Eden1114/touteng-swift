//
//  WebView.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/28.
//

import SwiftUI
import Combine
import WebKit

@dynamicMemberLookup
public class WebViewStore: ObservableObject {
  @Published public var webView: WKWebView {
    didSet {
      setupObservers()
    }
  }
  
  public init(webView: WKWebView = WKWebView()) {
    self.webView = webView
    setupObservers()
  }
  
  private func setupObservers() {
    func subscriber<Value>(for keyPath: KeyPath<WKWebView, Value>) -> NSKeyValueObservation {
      return webView.observe(keyPath, options: [.prior]) { _, change in
        if change.isPrior {
          self.objectWillChange.send()
        }
      }
    }
    
    observers = [
      subscriber(for: \.title),
      subscriber(for: \.url),
      subscriber(for: \.isLoading),
      subscriber(for: \.estimatedProgress),
      subscriber(for: \.hasOnlySecureContent),
      subscriber(for: \.serverTrust),
      subscriber(for: \.canGoBack),
      subscriber(for: \.canGoForward)
    ]
  }
  
  private var observers: [NSKeyValueObservation] = []
  
  public subscript<T>(dynamicMember keyPath: KeyPath<WKWebView, T>) -> T {
    webView[keyPath: keyPath]
  }
}

#if os(iOS)
/// A container for using a WKWebView in SwiftUI
public struct WebView: View, UIViewRepresentable {
  /// The WKWebView to display
  public let webView: WKWebView
  
  public init(webView: WKWebView) {
    self.webView = webView
  }
  
  public func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
    webView
  }
  
  public func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
  }
}
#endif

//#if os(macOS)
///// A container for using a WKWebView in SwiftUI
//public struct WebView: View, NSViewRepresentable {
//  /// The WKWebView to display
//  public let webView: WKWebView
//
//  public init(webView: WKWebView) {
//    self.webView = webView
//  }
//
//  public func makeNSView(context: NSViewRepresentableContext<WebView>) -> WKWebView {
//    webView
//  }
//
//  public func updateNSView(_ uiView: WKWebView, context: NSViewRepresentableContext<WebView>) {
//  }
//}
//#endif
