//
//  UserDetailView.swift
//  GitHub
//
//  Created by Min Thant on 02/08/2025.
//

import SwiftUI

import SwiftUI

struct UserDetailView: View {
    var userId: Int
    @StateObject var viewModel = ViewModel()

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack(alignment: .leading, spacing: 16) {

                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.userDetail?.login ?? "")
                        .font(.title).fontWeight(.bold)

                    AsyncImage(url: URL(string: viewModel.userDetail?.avatarUrl ?? "")) { image in
                        image.resizable().aspectRatio(contentMode: .fill)
                    } placeholder: { ProgressView() }
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())

                    Text(viewModel.userDetail?.login ?? "")
                        .font(.headline).fontWeight(.semibold)

                    Text(viewModel.userDetail?.name ?? "")
                        .font(.subheadline)
                        .foregroundColor(.primary)

                    HStack {
                        Text("Followers: \(viewModel.userDetail?.followers ?? 0)")
                            .foregroundStyle(.gray)
                        Spacer()
                        Text("Following: \(viewModel.userDetail?.following ?? 0)")
                            .foregroundStyle(.gray)
                    }
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("Repositories")
                        .font(.title3).bold()
                        .padding(.top, 8)

                    ForEach(viewModel.repositories) { repo in
                        RepoRowView(
                            RepoName: repo.name,
                            Language: repo.language ?? "",
                            Stars: repo.stargazersCount,
                            RepoDesc: repo.description ?? ""
                        )
                        .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
            .padding()
        }
        .task {
            await viewModel.getUserDetail(id: userId)
            await viewModel.getRepositories(url: viewModel.userDetail?.reposUrl ?? "")
        }
    }
}


