//
//  CoingeckoNetworkManager.swift
//  FetchData
//
//  Created by Surya Rayala on 2/13/26.
//

import Foundation

protocol CoingeckoNetworkManagerProtocol {
    func fetchCoingeckoData(url: String) async throws -> CoinGeckoResponse
}

class CoingeckoNetworkManager: CoingeckoNetworkManagerProtocol {
    func fetchCoingeckoData(url: String) async throws -> CoinGeckoResponse {
        guard let url = URL(string: url) else {
            print("Invalid URL: \(url)")
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(CoinGeckoResponse.self, from: data)
    }
}
