//
//  UserData.swift
//  Coffe App
//
//  Created by Владимир  Лукоянов on 24.01.2024.
//

import Foundation

struct UserSucess: Codable {
    let token: String
    let tokenLifetime: Int
}

struct Coffe: Codable {
    let id: String
    let name: String
    let point: Coordinate
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case point
    }
}

struct Product: Codable {
    let id: String
    let name: String
    let imageURL: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case imageURL
        case price
    }
}

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
}
