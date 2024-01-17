//
//  UserData.swift
//  RandomUsers
//
//  Created by Kevin Martinez on 1/16/24.
//

import Foundation

// using the new @Observable Macro we dont have this Problem
@Observable
class UserData {
    
    var users = [User]()
    
    
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
