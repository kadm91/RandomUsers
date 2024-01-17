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
            VStack (alignment: .leading) {
                Text("Raw JSON Data:")
                    .font(.headline)
                    .bold()
                    .underline()
                    .padding(.vertical)
                
                ScrollView {
                    Text(userData.users)
                }
            }
            .padding()
            .navigationTitle("Random User")
        }
    }
}

#Preview {
    UsersView()
}
