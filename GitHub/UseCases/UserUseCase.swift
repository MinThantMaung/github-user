//
//  UserUseCase.swift
//  GitHub
//
//  Created by Min Thant on 11/09/2025.
//

import Alamofire
import Foundation


protocol UserUseCaseDelegate:AnyObject {
    func fetchUser() async throws-> [User]
    func fetchUserDetail(id: Int) async throws -> UserDetailResponse
    func fetchRepositoriesByUser(url: String) async throws -> [UserRepo]
}

class UserUseCase: UserUseCaseDelegate{
    private let repository: UserRepositoryDelegate
    private var cache: [User] = []
    
    init(repository: UserRepositoryDelegate = UserRepository()) {
        self.repository = repository
    }
    func fetchUser() async throws-> [User] {
        let users = try await repository.fetchUser()
        cache = users
        return users
    }
    func fetchUserDetail(id: Int) async throws -> UserDetailResponse {
        let user = try await repository.fetchUserDetail(id: id)
        return user
    }
    func fetchRepositoriesByUser(url: String) async throws -> [UserRepo] {
        let repo = try await repository.fetchRepositoriesByUser(url: url)
        return repo
    }
    
}
