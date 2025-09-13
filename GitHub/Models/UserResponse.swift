//
//  UserResponse.swift
//  GitHub
//
//  Created by Min Thant on 12/09/2025.
//


struct UserDetailResponse: Identifiable, Decodable,Encodable {
    var id: Int
    var login: String
    var avatarUrl: String
    var name: String
    var followers: Int
    var following: Int
    var reposUrl: String
}

