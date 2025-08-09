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
                    Image(systemName: imageName)
                        .imageScale(.large)
                        .foregroundStyle(.tint)
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

