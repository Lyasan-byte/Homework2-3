//
//  ContentViewBooks.swift
//  Homework2
//
//  Created by Ляйсан on 17.07.2025.
//

import SwiftUI

struct ContentViewBooks: View {
    @EnvironmentObject private var userService: UserService
    
    var body: some View {
        NavigationView {
            List(userService.books) { book in
                HStack {
                    VStack(alignment: .leading) {
                        Text(book.title)
                            .font(.headline)
                        Text(book.author)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        userService.toggleFavorite(bookID: book.id)
                    }) {
                        Image(systemName: userService.isFavorite(book: book) ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Книги")
        }
    }
}

#Preview {
    ContentViewBooks()
        .environmentObject(UserService())
}
