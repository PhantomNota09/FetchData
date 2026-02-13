//
//  TypicodeModel.swift
//
//  Created by Surya Rayala on 2/13/26.
//

import Foundation

// Typicode Model
struct TypicodeModel: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    let completed: Bool?
}

// CoinGecko Model
struct CoinGeckoResponse: Codable {
    let bitcoin: Price?
    let ethereum: Price?
}

struct Price: Codable {
    let usd: Double?
}

// UserData Model
struct UserModel: Codable {
    let id : Int?
    let name : String?
    let username : String?
    let email : String?
    let address : Address?
    let phone : String?
    let website : String?
    let company : Company?
    
}

struct Address: Codable {
    let street : String?
    let suite : String?
    let city : String?
    let zipcode : String?
    let geo : Geo?
}

struct Geo: Codable {
    let lat : String?
    let lng : String?
}

struct Company: Codable {
    let name : String?
    let catchPhrase : String?
    let bs : String?
}
