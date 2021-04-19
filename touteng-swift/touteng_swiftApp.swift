//
//  touteng_swiftApp.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/19.
//

import SwiftUI

@main
struct touteng_swiftApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
