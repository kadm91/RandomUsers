//
//  UsersView.swift
//  RandomUsers
//
//  Created by Kevin Martinez on 1/16/24.
//

import SwiftUI

struct UsersView: View {
    
    @State var userData = UserData()
    
    var body: some View {
        NavigationStack {
            List(userData.users){
                Text($0.fullName)
                }
            .navigationTitle("Random User")
        }
    }
}

#Preview {
    UsersView()
}
