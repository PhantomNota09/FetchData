//
//  MockUserdataNetworkManager.swift
//  FetchData
//
//  Created by Surya Rayala on 2/17/26.
//

import Foundation

// MARK: - Mock UserData Network Manager

class MockUserdataNetworkManager: UserDataNetworkManagerProtocol {
    static let shared = MockUserdataNetworkManager()
    init() {}

    func fetchUserData(url: String) async throws -> [UserModel] {
        guard let _ = URL(string: url) else {
            print("Log: Invalid URL")
            return []
        }

        return [
            UserModel(
                id: 1,
                name: "Alice Johnson",
                username: "alicej",
                email: "alice@example.com",
                address: Address(
                    street: "123 Main St",
                    suite: "Apt 4B",
                    city: "Springfield",
                    zipcode: "12345",
                    geo: Geo(lat: "40.7128", lng: "-74.0060")
                ),
                phone: "555-1234",
                website: "alice.dev",
                company: Company(
                    name: "Alice Corp",
                    catchPhrase: "Building the future",
                    bs: "synergize scalable solutions"
                )
            ),
            UserModel(
                id: 2,
                name: "Bob Smith",
                username: "bsmith",
                email: "bob@example.com",
                address: Address(
                    street: "456 Oak Ave",
                    suite: "Suite 7",
                    city: "Shelbyville",
                    zipcode: "67890",
                    geo: Geo(lat: "34.0522", lng: "-118.2437")
                ),
                phone: "555-5678",
                website: "bobsmith.io",
                company: Company(
                    name: "Smith LLC",
                    catchPhrase: "Innovation at scale",
                    bs: "deliver robust infrastructures"
                )
            )
        ]
    }
}

