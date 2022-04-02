//
//  FriendsLoader.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 13.03.2022.
//

class FriendsLoader {
    static var friends = [
        FriendModel(name: "Александр", image: "1", storedImages: ["1","2","3","4"]),
        FriendModel(name: "Дмитрий", image: "1", storedImages: ["1","2","4"]),
        FriendModel(name: "Владимир", image: "1", storedImages: ["1","2","3","4"]),
        FriendModel(name: "Александр", image: "1", storedImages: ["1","3","4"]),
        FriendModel(name: "Борис", image: "1", storedImages: ["3","4"]),
        FriendModel(name: "Александр", image: "1", storedImages: ["1","2","3","4"]),
        FriendModel(name: "Екатерина", image: "1", storedImages: ["1","2","3","4"]),
        FriendModel(name: "Александр", image: "1", storedImages: ["1","2","3","4"])
    ]

//    static func iNeedFriends() -> [FriendsSection] {
//        let sortedArray = sortFriends(array: friends)
//        let sectionsArray = formFriendsSection(array: sortedArray)
//        return sectionsArray
//    }
//
//
//    static func sortFriends(array: [FriendModel]) -> [Character: [FriendModel]] {
//        var newArray: [Character: [FriendModel]] = [:]
//
//        for friend in array {
//            guard let firstChar = friend.name.first else {
//                continue
//            }
//
//            guard var array = newArray[firstChar] else {
//                let newValue = [friend]
//                newArray.updateValue(newValue, forKey: firstChar)
//                continue
//            }
//
//            array.append(friend)
//
//            newArray.updateValue(array, forKey: firstChar)
//        }
//        return newArray
//    }
//
//    static func formFriendsSection(array: [Character: [FriendModel]]) -> [FriendsSection] {
//        var sectionsArray: [FriendsSection] = []
//
//        for (key, array) in array {
//            sectionsArray.append(FriendsSection(key: key, data: array))
//        }
//        sectionsArray.sort { $0 < $1 }
//
//        return sectionsArray
//    }
}
