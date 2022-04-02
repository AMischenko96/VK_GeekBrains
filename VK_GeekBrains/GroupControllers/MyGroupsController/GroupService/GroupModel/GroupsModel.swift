//
//  GroupsModel.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 01.04.2022.
//

import Foundation

struct SearchGroup: Decodable {
    let response: ResponseGroup
}

struct ResponseGroup: Decodable {
    let count: Int
    let items: [Group]
}

struct Group: Decodable {
    let id: Int
    let name: String
    let photo100: String
    let is_member: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case is_member
        case photo100 = "photo_100"
    }
}
