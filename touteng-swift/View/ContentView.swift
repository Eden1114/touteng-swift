//
//  ContentView.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/19.
//


import SwiftUI
import Foundation

struct ContentView: View {
    @EnvironmentObject var userData:UserData
    
    var body: some View {
//        TabView {
            PostListView(category: .all)
//            .tabItem({
//                Image(systemName: "gear")
//                Text("全部")
//                RoundedRectangle(cornerRadius: 10.0)
//            })
//
//            PostListView(category: .military)
//            .tabItem({
//                Image(systemName: "gear")
//                Text("军事")
//                RoundedRectangle(cornerRadius: 10.0)
//            })
//
//            PostListView(category: .entertainment)
//            .tabItem({
//                Image(systemName: "gear")
//                Text("娱乐")
//                RoundedRectangle(cornerRadius: 10.0)
//            })
//
//
//            PostListView(category: .tech)
//            .tabItem({
//                Image(systemName: "gear")
//                Text("科技")
//                RoundedRectangle(cornerRadius: 10.0)
//            })
//        }
    }
    
    
//    var test: some View {
//        NavigationView {
//            GeometryReader { geometry in
//                HScrollViewController(pageWidth: geometry.size.width,
//                                      contentSize: CGSize(width: geometry.size.width * 2,
//                                                          height: geometry.size.height,
//                                                          leftPercent: self.$leftPercent)
//
//            }
//        }
//    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData.testData)
    }
}

