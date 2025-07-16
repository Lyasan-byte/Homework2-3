//
//  ContentViewUserProfile.swift
//  Homework2
//
//  Created by Ляйсан on 15.07.2025.
//

import SwiftUI

struct ContentViewProfile: View {
    var user: User
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "arrow.left.to.line.compact")
                        .font(.system(size:18))
                        .foregroundStyle(Color.white)
                })
                Spacer()
            }
            .padding(.top, 50)
            .padding(.leading, 30)
            
            
            VStack {
                if user.name == "Laysan" {
                    Image(.laysan)
                        .resizable()
                        .frame(width: 250, height: 330)
                        .clipShape(Circle())
                    
                    Text("\(user.name)")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 30))
                        .italic()
                        .fontWeight(.bold)
                        
                    Text("\(user.bio)")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 18))
                        .padding(.top, 0.1)
                    
                        
                } else {
                    Image(.byte)
                        .resizable()
                        .frame(width: 250, height: 330)
                        .clipShape(Circle())
                    
                    Text("\(user.name)")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 30))
                        .italic()
                        .fontWeight(.bold)
                        
                    Text("\(user.bio)")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
                        .padding(.leading, 35)
                        .padding(.trailing, 30)
                        .padding(.top, 0.1)
                }
            }
            Spacer()
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black).ignoresSafeArea()
        
        
        
    }
}

#Preview {
    ContentViewProfile(user: User(name: "Byte", bio: "a group of mysterious binary digits or bits operated on as a unit. Extremely dangerous", password: "disaster"))
}
