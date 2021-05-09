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
        TabView {
            PostListView(category: .all).environmentObject(userData)
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
            .onAppear {
                // TODO
            }
           
            
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
        ContentView().environmentObject(UserData())
    }
}

