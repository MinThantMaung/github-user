//
//  UserDetailView.swift
//  GitHub
//
//  Created by Min Thant on 02/08/2025.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    let repositories: [Repository] = [
            Repository(name: "Setting", language: "Swift", stars: 129,description: "A cool Swift project."),
            Repository(name: "TodoApp", language: "TypeScript", stars: 200, description: "Simple Todo app with backend."),
            Repository(name: "GithubUser", language: "Java", stars: 350.5, description: "")
        ]
    var body: some View {
        VStack(alignment: .leading){
            Text(user.name)
                .font(.title)
                .fontWeight(.bold)
            Image(systemName: user.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            Text(user.name)
                .font(.headline)
                .fontWeight(.semibold)
            Text("Tom Preston-Werner")
                .font(.subheadline)
                .foregroundColor(.primary)
            HStack{
                Text("Follower: 24,283")
                    .foregroundStyle(.gray)
                Spacer()
                Text("Following: 11")
                    .foregroundStyle(.gray)
            }
            VStack{
                Text("Repositories")
                    .padding(.top,20)
                ForEach(repositories) { repo in
                    RepoRowView(
                        RepoName: repo.name,
                        Language: repo.language,
                        Stars: repo.stars,
                        RepoDesc: repo.description
                    )
                }
            }
        }
        .padding()
    }
}

