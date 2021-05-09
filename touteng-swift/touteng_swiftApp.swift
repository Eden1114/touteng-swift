//
//  touteng_swiftApp.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/19.
//

import SwiftUI

@main
struct touteng_swiftApp: App {
//    let persistenceController = PersistenceController.shared
//    @Environment(\.scenePhase) private var scenePhase
//    @StateObject private var cache = DataCache()
//    static var userData = UserData()
//    var ad1:Void = userData.loadAd()
//    var ad2:Void = userData.loadList(category: .all, request_type: "1")
    private var userData:UserData = UserData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userData)
//            touteng_swiftApp.
                .onAppear(perform: {
//                    self.userData.loadAd()
                    debugPrint("perform")
//                    self.userData.loadList(category: .military, request_type: "1")
                    debugPrint(self.userData.all_postlists)
//                    self.userData.loadList(category: .entertainment, request_type: "1")
//                    self.userData.loadList(category: .military, request_type: "1")
//                    self.userData.loadList(category: .tech, request_type: "1")
                    
//                    touteng_swiftApp.userData.loadAd()
//                    touteng_swiftApp.userData.loadList(category: .all, request_type: "1")
                })
        }
    }
}
