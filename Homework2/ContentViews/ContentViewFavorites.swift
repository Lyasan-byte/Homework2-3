//
//  ContentViewFavorites.swift
//  Homework2
//
//  Created by Ляйсан on 17.07.2025.
//

import SwiftUI

struct ContentViewFavorites: View {
    @EnvironmentObject private var userService: UserService
    
    var favoriteBooks: [Book] {
        userService.books.filter { userService.isFavorite(book: $0) }
    }
    
    var body: some View {
        NavigationView {
            if favoriteBooks.isEmpty {
                Text("Нет избранных книг")
                    .foregroundColor(.gray)
            } else {
                List(favoriteBooks) { book in
                    VStack(alignment: .leading) {
                        Text(book.title)
                            .font(.headline)
                        Text(book.author)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .navigationTitle("Избранное")
            }
        }
    }
}

#Preview {
    ContentViewFavorites()
        .environmentObject(UserService())
}


