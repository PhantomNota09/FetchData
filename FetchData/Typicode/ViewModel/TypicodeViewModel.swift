//
//  TypicodeViewModel.swift
//  FetchData
//
//  Created by Surya Rayala on 2/13/26.
//

import Foundation

class TypicodeViewModel {
    var typicodeData: [TypicodeModel] = []

    var isOnline: Bool = true

    private let liveService: TypicodeNetworkManagerProtocol
    private let mockService: TypicodeNetworkManagerProtocol

    init(
        liveService: TypicodeNetworkManagerProtocol = TypicodeNetworkManager.shared,
        mockService: TypicodeNetworkManagerProtocol = MockTypicodeNetworkManager.shared
    ) {
        self.liveService = liveService
        self.mockService = mockService
    }

    private var activeService: TypicodeNetworkManagerProtocol {
        isOnline ? liveService : mockService
    }

    func fetchData() async {
        do {
            typicodeData = try await activeService.fetchTypicodeData(url: Server.TypicodeDataURL.rawValue)
        } catch {
            print("Failed to fetch data: \(error)")
            typicodeData = []
        }
    }
}
