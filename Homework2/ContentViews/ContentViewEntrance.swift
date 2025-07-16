//
//  ContentView.swift
//  Homework2
//
//  Created by Ляйсан on 15.07.2025.
//

import SwiftUI

struct ContentViewEntrance: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var isAuthorized: User?
    @State var hasError: Bool = false
    
    @StateObject private var userService: UserService = UserService()
    
    var body: some View {
        VStack {
            Image(systemName: "sos.circle.fill")
                .font(.system(size: 26))
                .foregroundStyle(.black)
            Text("Lyasan-byte presents")
            
            Text("Log in")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            
            TextField("Username", text: $username)
            
                .padding(.top, 30)
            
            SecureField("Password", text: $password)
                .padding(.top, 20)
            
            Button(action: {
                isAuthorized = userService.authorize(username: username, password: password)
                hasError = (isAuthorized == nil)
            }, label: {
                Image(systemName: hasError ? "lock.trianglebadge.exclamationmark" : "lock")
                    .font(.system(size:22))
                    .padding(.top, 20)
                    .foregroundStyle(Color.red)
            })
            
        }
        .padding()
        .fullScreenCover(item: $isAuthorized) { user in
            ContentViewProfile(user: user)
        }
    }
}

#Preview {
    ContentViewEntrance()
}
