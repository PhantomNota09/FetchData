//
//  TypicodeModel.swift
//  FetchData
//
//  Created by Surya Rayala on 2/13/26.
//

import Foundation

struct TypicodeModel: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    let completed: Bool?

    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id
        case title
        case completed
    }
}
