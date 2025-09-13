//
//  ViewModel.swift
//  GitHub
//
//  Created by Min Thant on 11/09/2025.
//

import Alamofire
import Foundation

@MainActor
class ViewModel: ObservableObject{
    
    @Published var users = [User]()
    @Published var repositories = [UserRepo]()
    @Published var userDetail: UserDetailResponse?
    private let useCase: UserUseCaseDelegate
    init(useCase: UserUseCaseDelegate = UserUseCase()){
        self.useCase = useCase
    }
    
    func getData() async {
        do{
            users = try await useCase.fetchUser()
        }catch{
            print("Error: \(error.localizedDescription)")
        }        
    }
    func getUserDetail(id: Int) async {
            do {
                userDetail = try await useCase.fetchUserDetail(id: id)
            } catch {
                print("Error fetching user detail: \(error.localizedDescription)")
            }
        }
    func getRepositories(url: String) async {
        do {
            repositories = try await useCase.fetchRepositoriesByUser(url: url)
        } catch {
            print("Error fetching user detail: \(error.localizedDescription)")
        }
    }
}
