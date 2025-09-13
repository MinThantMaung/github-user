//
//  UserResponse.swift
//  GitHub
//
//  Created by Min Thant on 12/09/2025.
//


struct UserDetailResponse: Identifiable, Decodable,Encodable {
    var id: Int
    var login: String
    var avatarUrl: String?
    var name: String
    var followers: Int
    var following: Int
    var reposUrl: String
    
    init(
            id: Int = 0,
            login: String = "",
            avatarUrl: String = "",
            name: String = "",
            followers: Int = 0,
            following: Int = 0,
            reposUrl: String = ""
        ) {
            self.id = id
            self.login = login
            self.avatarUrl = avatarUrl
            self.name = name
            self.followers = followers
            self.following = following
            self.reposUrl = reposUrl
        }
}

