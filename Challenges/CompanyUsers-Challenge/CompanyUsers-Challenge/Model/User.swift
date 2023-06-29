//
//  User.swift
//  CompanyUsers-Challenge
//
//  Created by Robert Basamac on 29.06.2023.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}
