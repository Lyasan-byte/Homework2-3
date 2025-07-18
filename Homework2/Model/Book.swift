//
//  Book.swift
//  Homework2
//
//  Created by Ляйсан on 17.07.2025.
//

import Foundation

struct Book: Identifiable, Codable {
    var id = UUID()
    var title: String
    var author: String
}
