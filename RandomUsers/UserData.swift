//
//  UserData.swift
//  RandomUsers
//
//  Created by Kevin Martinez on 1/16/24.
//

import Foundation

class UserData {
    var users = ""
    
    
    init()  {
        Task {
         await loadUsers()
        }
    }
    
    func loadUsers() async {
        do {
            let users = try await UserFetchingClient.getUser()
            self.users = users
        } catch {
            print(error)
        }
    }
    
}
