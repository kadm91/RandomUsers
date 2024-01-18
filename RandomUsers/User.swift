//
//  User.swift
//  RandomUsers
//
//  Created by Kevin Martinez on 1/17/24.
//

import Foundation

struct Response: Decodable {
    let users: [User]
    
    enum CodingKeys: String, CodingKey {
        case users = "results"
    }
}

struct User: Identifiable, Decodable {
    let id: String
    let name: Name
    let picture: Picture
    
    var fullName: String {
        name.title + ". " + name.first + " " + name.last
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case login
        case picture
    }
    
    enum LoginInfoCodingKeys: String, CodingKey {
        case uuid
    }
    
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(Name.self, forKey: .name)
        
        let loginInfo = try values.nestedContainer(keyedBy: LoginInfoCodingKeys.self, forKey: .login)
        self.id = try loginInfo.decode(String.self, forKey: .uuid)
        
        self.picture = try values.decode(Picture.self, forKey: .picture)
    }
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}
