//
//  touteng_swiftApp.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/19.
//

import SwiftUI

@main
struct touteng_swiftApp: App {

    static private var userData:UserData = UserData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(touteng_swiftApp.userData)
                .onAppear(perform: {
                    // DO request
                })
        }
    }
}
