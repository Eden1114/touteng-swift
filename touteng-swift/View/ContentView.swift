//
//  ContentView.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/19.
//


import SwiftUI
import Foundation
//import SwiftyJSON

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
        return NavigationView {
            Form {
                Section {
                    Text("Hello World")
                }
                Section {
                    Text("Hello World")
                }
            }
            .navigationBarTitle(Text("头疼"))
            
            TabView {
                VStack {
                    Text("The home page.")
                    Button(action: {
                        self.startListLoad()
                    }) {
                        Text("Start").font(.largeTitle)
                    }
                    
                    Button(action: {
                        self.startAdLoad()
                    }) {
                        Text("Start").font(.largeTitle)
                    }
                }
                .tabItem({
                    Image(systemName: "gear")
                    Text("全部")
                    RoundedRectangle(cornerRadius: 10.0)
                })
                .tag(0)

                VStack {
                    URLImageView(url: "https://p1-tt-ipv6.byteimg.com/img/web.business.image/202103255d0d8b15c00cd8f945659788~tplv-tt-shrink:1080:0.image?from=feed")
                    Text("The settings page.")
                }
                .tabItem({
                    Image(systemName: "gear")
                    Text("军事")
                    RoundedRectangle(cornerRadius: 10.0)
                })
                .tag(1)
               
                
                VStack {
                    Text("The settings page.")
                }
                .tabItem({
                    Image(systemName: "gear")
                    Text("娱乐")
                    RoundedRectangle(cornerRadius: 10.0)
                })
                .tag(1)
              }
            }
        }
    

    
    func update(_ pl: Any) {
        debugPrint(pl)
    }
    
    func startListLoad() -> Void {
        NetworkAPI.getList(parameters:
                            ["category":"all",
                             "request_type": "1",
                             "response_extra":""]) {result in
            switch result {
            case let .success(postlist):
                let list = postlist
                self.update(list)
            case let .failure(error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func startAdLoad() -> Void {
        NetworkAPI.getAdInfo(parameters: nil) {result in
            switch result {
            case let .success(postlist):
                let list = postlist
                self.update(list)
                break
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

