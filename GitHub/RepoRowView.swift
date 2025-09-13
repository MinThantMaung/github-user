//
//  RepoRowView.swift
//  GitHub
//
//  Created by Min Thant on 02/08/2025.
//

import SwiftUI

struct RepoRowView: View {
    let RepoName: String
    let Language: String
    let Stars: Int
    let RepoDesc: String
    var body: some View {
        VStack {
            Button(
                action: {
                    
                }) {
                    VStack(alignment: .leading){
                        Text(RepoName)
                        .foregroundColor(.blue)
                        .fontWeight(.semibold)
                        HStack {
                            Text(Language)
                            .foregroundColor(.gray)
                            Spacer()
                            HStack() {
                                Image(systemName: "star")
                                .foregroundColor(.gray)
                                Text("\(Stars)")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            }
                        }
                        if(
                            !RepoDesc.isEmpty
                        ){
                            Text(RepoDesc)
                            .foregroundColor(.gray)
                        }
                        Divider()
                    }
                }
                .padding()
                .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    RepoRowView(
        RepoName: "GithubUser",
        Language: "Swift",
        Stars: 4,
        RepoDesc: "this is Desc"
    )
}
