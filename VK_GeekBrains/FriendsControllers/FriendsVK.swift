//
//  FriendsVK.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 13.03.2022.
//

import RealmSwift
import Foundation

struct FriendsVK: Decodable {
    let response: ResponseFriends
}

struct ResponseFriends: Decodable {
    let count: Int
    let items: [Friend]
}

class Friend: Object, Decodable {
    @objc dynamic var id: Int
    @objc dynamic var firstName, lastName: String
    @objc dynamic var photo50: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo50 = "photo_50"
    }
}

