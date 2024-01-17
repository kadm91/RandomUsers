//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by Kevin Martinez on 1/16/24.
//

import Foundation

struct UserFetchingClient: Codable {
    static private let url = URL(string: "https://randomuser.me/api/?results=10&format=pretty")!
    
    static func getUser() async throws -> String {
        async let (data, _) = URLSession.shared.data(from: url)
        return try await String(data: data, encoding: .utf8)!
        
    }
}
