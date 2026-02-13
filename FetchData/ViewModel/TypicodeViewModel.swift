//
//  TypicodeViewModel.swift
//  FetchData
//
//  Created by Surya Rayala on 2/13/26.
//

import Foundation

class TypicodeViewModel {
    var typicodeData: [TypicodeModel] = []
    var isLoading: Bool = false
    
    private let networkService: TypicodeNetworkManagerProtocol
    
    init(networkService: TypicodeNetworkManagerProtocol) {
        self.networkService = networkService
    }
    
    func fetchData() async {
        do {
            typicodeData = try await networkService.fetchTypicodeData(url: Server.TypicodeDataURL.rawValue)
        } catch {
            print("Failed to fetch data: \(error)")
            typicodeData = []
        }
    }
}
