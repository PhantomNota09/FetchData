//
//  UserDataViewModel.swift
//  FetchData
//
//  Created by Surya Rayala on 2/13/26.
//

import Foundation

class UserDataViewModel {
    var userData: [UserModel] = []
    var isLoading: Bool = false
    
    private let networkService: UserDataNetworkManagerProtocol
    
    init(networkService: UserDataNetworkManagerProtocol) {
        self.networkService = networkService
    }
    
    func fetchData() async {
        do {
            userData = try await networkService.fetchUserData(url: Server.UserDataURL.rawValue)
        } catch {
            print("Failed to fetch data: \(error)")
            userData = []
        }
    }
}
