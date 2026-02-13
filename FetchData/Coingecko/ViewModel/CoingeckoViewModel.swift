//
//  CoingeckoViewModel.swift
//  FetchData
//
//  Created by Surya Rayala on 2/13/26.
//

import Foundation
class CoingeckoViewModel {
    var coinData: CoinGeckoResponse?
    
    private let networkService: CoingeckoNetworkManagerProtocol
    
    init(networkService: CoingeckoNetworkManagerProtocol) {
        self.networkService = networkService
    }
    
    func fetchData() async {
        do {
            coinData = try await networkService.fetchCoingeckoData(url: Server.CoinGeckoDataURL.rawValue)
        } catch {
            print("Failed to fetch data: \(error)")
        }
    }
}

