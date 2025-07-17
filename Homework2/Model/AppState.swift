//
//  AppState.swift
//  Homework2
//
//  Created by Ляйсан on 17.07.2025.
//

import Foundation

class AppState: ObservableObject {
    @Published var currentScreen: Screen = .profile
    
    enum Screen {
        case main, favorites, profile
    }
}
