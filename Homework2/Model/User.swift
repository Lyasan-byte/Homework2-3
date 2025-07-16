//
//  User.swift
//  Homework2
//
//  Created by Ляйсан on 15.07.2025.
//

import SwiftUI

class ModelView: ObservableObject {
    @AppStorage("username1") var username1: String = "ByteCode"
    @AppStorage("password1") var password1: String = "swift2025"
    
    @AppStorage("username2") var username2: String = "Lyasan"
    @AppStorage("password2") var password2: String = "disaster"
    
    func authorize(username: String, password: String) -> Bool {
        return (username1 == username && password1 == password) || (username2 == username && password2 == password)
    }  
}
