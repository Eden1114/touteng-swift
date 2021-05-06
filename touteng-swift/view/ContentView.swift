//
//  ContentView.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/19.
//


import SwiftUI
import Foundation

struct toutengView: View {
    
    var body: some View {
        return VStack {
            ForEach(0..<4) { index in
                ZStack{
                    RoundedRectangle(cornerRadius: 10).fill(Color.white)
                    RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                    Text("ghost")
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}


struct ContentView: View {
    var body: some View {
        TabView {
            VStack {
                toutengView()
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

    
//    func startAdLoad() -> Void {
//        NetworkAPI.getAdInfo(parameters: nil) {result in
//            switch result {
//            case let .success(postlist):
//                let list = postlist
//                self.update(list)
//                break
//            case let .failure(error):
//                debugPrint(error)
//            }
//        }
//    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

