//
//  MockCoingeckoNetworkManager.swift
//  FetchData
//
//  Created by Surya Rayala on 2/17/26.
//

import Foundation

// MARK: - Mock CoinGecko Network Manager

class MockCoingeckoNetworkManager: CoingeckoNetworkManagerProtocol {
    static let shared = MockCoingeckoNetworkManager()
    init() {}

    func fetchCoingeckoData(url: String) async throws -> CoinGeckoResponse {
        guard let _ = URL(string: url) else {
            print("Log: Invalid URL")
            throw URLError(.badURL)
        }

        return CoinGeckoResponse(
            bitcoin: Price(usd: 67_000.00),
            ethereum: Price(usd: 2_000.00)
        )
    }
}

