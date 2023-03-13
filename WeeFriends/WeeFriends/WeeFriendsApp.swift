//
//  WeeFriendsApp.swift
//  WeeFriends
//
//  Created by Steven McWee on 09/03/2023.
//

import SwiftUI

@main
struct WeeFriendsApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
