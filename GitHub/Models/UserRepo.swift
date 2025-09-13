//
//  UserRepo.swift
//  GitHub
//
//  Created by Min Thant on 13/09/2025.
//


import Foundation

struct UserRepo: Identifiable, Decodable, Encodable {
    var id: Int
    var name: String
    var description: String?
    var language: String?
    var stargazersCount: Int
}
