//
//  MockTypicodeNetworkManager.swift
//  FetchData
//
//  Created by Surya Rayala on 2/17/26.
//

import Foundation

// MARK: - Mock Typicode Network Manager

class MockTypicodeNetworkManager: TypicodeNetworkManagerProtocol {
    static let shared = MockTypicodeNetworkManager()
    init() {}
    func fetchTypicodeData(url: String) async throws -> [TypicodeModel] {
        guard let _ = URL(string: url) else {
            print("Log: Invalid URL")
            return []
        }

        return [
            TypicodeModel(userId: 1, id: 1, title: "Mock Task One", completed: false),
            TypicodeModel(userId: 1, id: 2, title: "Mock Task Two", completed: true),
            TypicodeModel(userId: 2, id: 3, title: "Mock Task Three", completed: false)
        ]
    }
}
