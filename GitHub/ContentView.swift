//
//  ContentView.swift
//  GitHub
//
//  Created by Min Thant on 02/0x8/2025.
//

import SwiftUI

struct ContentView: View {
    let users: [User] = [
        User(name: "Min Thant",imageName: "person.circle"),
        User(name: "John",imageName: "globe"),
        User(name: "Jane",imageName: "star"),
        User(name: "Mia",imageName: "moon"),
        User(name: "Johnny",imageName: "cloud"),
        User(name: "Smith",imageName: "sun.max")
    ]
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(users) { user in
                    NavigationLink(
                        destination: UserDetailView(user: user)
                    ){
                        RowView(
                            name: user.name,
                            imageName: user.imageName
                        )
                    }
                }
            }
            .navigationTitle("Github Users")
        }
    }
}

#Preview {
    ContentView()
}

