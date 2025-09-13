//
//  RowView.swift
//  GitHub
//
//  Created by Min Thant on 02/08/2025.
//

import SwiftUI

struct RowView: View {
    let name: String
    let imageName: String
    var body: some View {
        HStack {
            Button(action: {
                
            }) {
                HStack {
                    AsyncImage(url: URL(string: imageName)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(
                                    width: 40,
                                    height: 40
                                )
                                .clipShape(
                                    Circle()
                                )
                    Text(name)
                }
            }
            .padding()
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    RowView(name: "John Doe",imageName: "person.circle")
}

