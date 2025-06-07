//
//  User.swift
//  Friendface
//
//  Created by Ino Yang Popper on 6/4/25.
//

import Foundation
import SwiftData

@Model
class User: Codable {
    enum CodingKeys: CodingKey {
        case id, isActive, name, about, age, company, address, email, registered, tags, friends
    }
    
        private(set) var id: UUID
        var isActive: Bool
        var name: String
        var about: String
        var age: Int
        var company: String
        var address: String
        var email: String
        var registered: Date
        var tags: [String]
        var friends: [Friend]

    static let example = User(id: UUID(), isActive: true, name: "Ino Yang Popper", about: "She is an incredible human being. She has flaws but that's perfectly fine because God made her that way for good purposes.", age: 30, company: "Badass Production LLC", address: "1111 Goodman ave, Los Angeles, CA, 9111", email: "ino,@badassproduction.com", registered: .now, tags: ["badass", "film production", "Hollywood production"], friends: [])
    
    init(id: UUID, isActive: Bool, name: String, about: String, age: Int, company: String, address: String, email: String, registered: Date, tags: [String], friends: [Friend]) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.about = about
        self.age = age
        self.company = company
        self.address = address
        self.email = email
        self.registered = registered
        self.tags = tags
        self.friends = friends
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        self.name = try container.decode(String.self, forKey: .name)
        self.about = try container.decode(String.self, forKey: .about)
        self.age = try container.decode(Int.self, forKey: .age)
        self.company = try container.decode(String.self, forKey: .company)
        self.address = try container.decode(String.self, forKey: .address)
        self.email = try container.decode(String.self, forKey: .email)
        self.registered = try container.decode(Date.self, forKey: .registered)
        self.tags = try container.decode([String].self, forKey: .tags)
        self.friends = try container.decode([Friend].self, forKey: .friends)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.isActive, forKey: .isActive)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.about, forKey: .about)
        try container.encode(self.age, forKey: .age)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.registered, forKey: .registered)
        try container.encode(self.tags, forKey: .tags)
        try container.encode(self.friends, forKey: .friends)
    }
}
