//
//  Homework2App.swift
//  Homework2
//
//  Created by Ляйсан on 15.07.2025.
//

import SwiftUI

@main
struct Homework2App: App {
    
    @StateObject private var appState = AppState()
        @StateObject private var userService = UserService()
    var body: some Scene {
        WindowGroup {
            ContentViewEntrance()
                            .environmentObject(appState)
                            .environmentObject(userService)
        }
    }
}
