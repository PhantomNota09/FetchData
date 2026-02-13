//
//  TypicodeNetworkManager.swift
//
//  Created by Surya Rayala on 2/13/26.
//

import Foundation

protocol TypicodeNetworkManagerProtocol {
    func fetchTypicodeData(url: String) async throws -> [TypicodeModel]
}

class TypicodeNetworkManager: TypicodeNetworkManagerProtocol {
    func fetchTypicodeData(url: String) async throws -> [TypicodeModel] {
        guard let url = URL(string: url) else {
            print("Invalid URL: \(url)")
            return[]
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode([TypicodeModel].self, from: data)
    }
}
