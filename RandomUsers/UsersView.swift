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
            List(userData.users){ user in
                Label(
                    title: { Text(user.fullName)},
                    icon: {
                        AsyncImage(url: URL(string: user.picture.thumbnail)) { image in
                            image.clipShape(Circle())
                        } placeholder: {
                            Image(systemName: "person")
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                    }
                )
            }
            .navigationTitle("Random User")
        }
    }
}

#Preview {
    UsersView()
}
