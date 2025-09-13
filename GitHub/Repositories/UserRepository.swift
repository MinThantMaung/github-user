//
//  UserRepository.swift
//  GitHub
//
//  Created by Min Thant on 12/09/2025.
//

import Alamofire
import Foundation


protocol UserRepositoryDelegate: AnyObject{
    func fetchUser() async throws-> [User]
    func fetchUserDetail(id: Int) async throws -> UserDetailResponse
    func fetchRepositoriesByUser(url: String) async throws -> [UserRepo]
}


class UserRepository: UserRepositoryDelegate {
    private let url = AppConfig.baseUrl + "/"
    
    private func getDecoder() -> JSONDecoder {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
    }
    func fetchUserDetail(id: Int) async throws -> UserDetailResponse {
            return try await withCheckedThrowingContinuation { continuation in
                AF.request("\(url)user/\(id)")
                    .responseDecodable(of: UserDetailResponse.self, decoder: getDecoder()) { response in
                        switch response.result {
                        case .success(let user):
                            continuation.resume(returning: user)
                        case .failure(let error):
                            continuation.resume(throwing: error)
                        }
                    }
            }
        }
    func fetchUser() async throws -> [User] {
        return try await withCheckedThrowingContinuation{continuation in
            AF.request("\(url)users").responseDecodable(of: [User].self,decoder: getDecoder()) { response in
                switch response.result {
                case .success(let users):
                    continuation.resume(returning: users)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    func fetchRepositoriesByUser(url: String) async throws -> [UserRepo] {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request("\(url)")
                .responseDecodable(of: [UserRepo].self, decoder: getDecoder()) { response in
                    switch response.result {
                    case .success(let repositories):
                        continuation.resume(returning: repositories)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
    
}
