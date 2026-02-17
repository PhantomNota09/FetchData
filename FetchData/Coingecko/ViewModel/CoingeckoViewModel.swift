//
//  CoingeckoViewModel.swift
//  FetchData
//
//  Created by Surya Rayala on 2/13/26.
//

import Foundation

class CoingeckoViewModel {
    var coinData: CoinGeckoResponse?

    var isOnline: Bool = true

    private let liveService: CoingeckoNetworkManagerProtocol
    private let mockService: CoingeckoNetworkManagerProtocol

    init(
        liveService: CoingeckoNetworkManagerProtocol = CoingeckoNetworkManager(),
        mockService: CoingeckoNetworkManagerProtocol = MockCoingeckoNetworkManager.shared
    ) {
        self.liveService = liveService
        self.mockService = mockService
    }

    private var activeService: CoingeckoNetworkManagerProtocol {
        isOnline ? liveService : mockService
    }

    func fetchData() async {
        do {
            coinData = try await activeService.fetchCoingeckoData(url: Server.CoinGeckoDataURL.rawValue)
        } catch {
            print("Failed to fetch data: \(error)")
        }
    }
}

