//
//  User.swift
//  Homework2
//
//  Created by Ляйсан on 15.07.2025.
//

import SwiftUI

struct User: Identifiable {
    var id: UUID = UUID()
    var name: String
    var bio: String
    var password: String
}

class UserService: ObservableObject {
    var users: [User] = [.init(name: "Laysan", bio: "crazy, chaotic, emotionally unstable", password: "disaster"), .init(name: "Byte", bio: "a group of mysterious binary digits or bits operated on as a unit. Extremely dangerous", password: "swift2025")]
    
    func authorize(username: String, password: String) -> User? {
        for user in users {
            if user.name == username && user.password == password {
                return user
            }
        }
        return nil
        
    }  
}
