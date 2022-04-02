//
//  FriendsSection.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 13.03.2022.
//

struct FriendsSection: Comparable {

    var key: Character
    var data: [Friend]

    static func < (lhs: FriendsSection, rhs: FriendsSection) -> Bool {
        return lhs.key < rhs.key
    }

    static func == (lhs: FriendsSection, rhs: FriendsSection) -> Bool {
        return lhs.key == rhs.key
    }
}
