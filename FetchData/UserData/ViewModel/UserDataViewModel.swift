//
//  UserDataViewModel.swift
//  FetchData
//
//  Created by Surya Rayala on 2/13/26.
//

import Foundation

class UserDataViewModel {
    var userData: [UserModel] = []

    var isOnline: Bool = true

    private let liveService: UserDataNetworkManagerProtocol
    private let mockService: UserDataNetworkManagerProtocol

    init(
        liveService: UserDataNetworkManagerProtocol = UserDataNetworkManager(),
        mockService: UserDataNetworkManagerProtocol = MockUserdataNetworkManager.shared
    ) {
        self.liveService = liveService
        self.mockService = mockService
    }

    private var activeService: UserDataNetworkManagerProtocol {
        isOnline ? liveService : mockService
    }

    func fetchData() async {
        do {
            userData = try await activeService.fetchUserData(url: Server.UserDataURL.rawValue)
        } catch {
            print("Failed to fetch data: \(error)")
        }
    }
}
