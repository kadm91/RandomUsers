//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by Kevin Martinez on 1/16/24.
//

import Foundation

struct UserFetchingClient: Codable {
    static private let url = URL(string: "https://randomuser.me/api/?results=10&format=pretty")!
    
    static func getUser() async throws -> [User] {
        async let (data, _) = URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode(Response.self, from: data)
        return response.users
    }
}
