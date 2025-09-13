//
//  User.swift
//  GitHub
//
//  Created by Min Thant on 02/08/2025.
//

import Foundation

struct User: Identifiable, Decodable,Encodable{
    var id: Int
    var login: String
    var avatarUrl: String
}
