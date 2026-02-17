//
//  UserDataNetworkManager.swift
//  FetchData
//
//  Created by Surya Rayala on 2/13/26.
//

import Foundation

protocol UserDataNetworkManagerProtocol {
    func fetchUserData(url: String) async throws -> [UserModel]
}

class UserDataNetworkManager: UserDataNetworkManagerProtocol {
    func fetchUserData(url: String) async throws -> [UserModel] {
        guard let url = URL(string: url) else {
            print("Invalid URL: \(url)")
            return[]
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode([UserModel].self, from: data)
    }
}
