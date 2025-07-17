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
    @Published var books: [Book] = [
        Book(title: "Swift для начинающих", author: "Apple"),
        Book(title: "Гарри Поттер", author: "Дж. Роулинг"),
        Book(title: "Властелин колец", author: "Дж. Толкин")
    ]
    
    @Published var users: [User] = [
        User(name: "Laysan", bio: "crazy, chaotic, emotionally unstable", password: "disaster"),
        User(name: "Byte", bio: "a group of mysterious binary digits or bits operated on as a unit. Extremely dangerous", password: "swift2025")
    ]
    
    @Published var favoriteBookIDs: Set<UUID> = []
    
    func authorize(username: String, password: String) -> User? {
        users.first { $0.name == username && $0.password == password }
    }
    
    func toggleFavorite(bookID: UUID) {
        if favoriteBookIDs.contains(bookID) {
            favoriteBookIDs.remove(bookID)
        } else {
            favoriteBookIDs.insert(bookID)
        }
    }
    
    func isFavorite(book: Book) -> Bool {
        favoriteBookIDs.contains(book.id)
    }
}
