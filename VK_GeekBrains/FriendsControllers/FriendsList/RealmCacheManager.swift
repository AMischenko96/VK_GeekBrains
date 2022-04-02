//
//  RealmCacheManager.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 28.03.2022.
//

import RealmSwift

class RealmCacheManager {
    func saveFriend(friend: [Friend]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(friend)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}
