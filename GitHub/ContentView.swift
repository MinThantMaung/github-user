//
//  ContentView.swift
//  GitHub
//
//  Created by Min Thant on 02/0x8/2025.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(viewModel.users) { user in
                    NavigationLink(
                        destination: UserDetailView(userId: user.id)
                    ){
                        RowView(
                            name: user.login,
                            imageName: user.avatarUrl
                        )
                    }
                }
            }
            .navigationTitle("Github Users")
        }
        .task {
            await viewModel.getData()
        }
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}

