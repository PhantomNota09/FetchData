//
//  CoinGeckoResponse.swift
//  FetchData
//
//  Created by Surya Rayala on 2/13/26.
//


import Foundation

// CoinGecko Model
struct CoinGeckoResponse: Codable {
    let bitcoin: Price?
    let ethereum: Price?
}

struct Price: Codable {
    let usd: Double?
}