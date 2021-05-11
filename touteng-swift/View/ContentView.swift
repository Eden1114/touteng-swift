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
    @State var leftPercent: CGFloat = 0
    
    var body: some View {
        NavigationView {
            GeometryReader{ geometry in
                HScrollViewController(pageWidth: UIScreen.main.bounds.width, contentSize: CGSize(width: UIScreen.main.bounds.width * 4, height: UIScreen.main.bounds.height),leftPercent:self.$leftPercent) {
                    HStack(spacing:0){
                        PostListView(category: .all)
                            .frame(width:UIScreen.main.bounds.width)
                        PostListView(category: .tech)
                            .frame(width:UIScreen.main.bounds.width)
                        PostListView(category: .military)
                            .frame(width:UIScreen.main.bounds.width)
                        PostListView(category: .entertainment)
                            .frame(width:UIScreen.main.bounds.width)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: $leftPercent))
            .navigationBarTitle("明日头疼",displayMode: .inline)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData.testData)
    }
}

