//
//  ContentView.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/19.
//


import SwiftUI
import Foundation

struct ContentView: View {
//    @State var all_list:PostList
//    @State var ad:AdvertisementList
    
    func loadList() -> Void {
        NetworkAPI.getList(parameters: ["":""]) {result in
            switch result {
            case let .success(postlist):
                let _ = postlist
//                self.all_list = postlist
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
    
    func loadAd() -> Void {
        NetworkAPI.getAdInfo(parameters: nil) {result in
            switch result {
            case let .success(ads):
                let _ = ads
//                self.ad = ads
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
    
    var body: some View {
        TabView {
            VStack {
//                var postlist = startAdLoad()
//                PostListView(postlist: PostList)
//                Text()
            }
            .tabItem({
                Image(systemName: "gear")
                Text("全部")
                RoundedRectangle(cornerRadius: 10.0)
            })

            VStack {
                Text("军事")
            }
            .tabItem({
                Image(systemName: "gear")
                Text("军事")
                RoundedRectangle(cornerRadius: 10.0)
            })
           
            
            VStack {
                Text("设置")
            }
            .tabItem({
                Image(systemName: "gear")
                Text("娱乐")
                RoundedRectangle(cornerRadius: 10.0)
            })
        }
    }

    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

