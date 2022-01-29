//
//  database.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 06.12.2021.
//

import UIKit

struct VKUser {
    let nameFriend: String
    let avatar: UIImage
    let userPhoto: [UIImage]
}
struct VKGroup {
    let nameGroup: String
    let avatarGroup: UIImage
}
struct VKNews {
    let newsText: String
    let newsPhoto: UIImage
}

let users: [VKUser] =
    [ VKUser (nameFriend: "Леонардо Ди Каприо",
              avatar: UIImage (named: "avatar1")!,
              userPhoto:
                [UIImage (named: "Леонардо1")!,
                 UIImage (named: "Леонардо2")!,
                 UIImage (named: "Леонардо3")!]),
      VKUser (nameFriend: "Том Круз",
              avatar: UIImage (named: "avatar2")!,
              userPhoto:
                [UIImage (named: "Том1")!,
                 UIImage (named: "Том2")!,
                 UIImage (named: "Том3")!]),
      VKUser (nameFriend: "Анжелина Джоли",
              avatar: UIImage (named: "avatar3")!,
                userPhoto:
                  [UIImage (named: "Анжелина1")!,
                   UIImage (named: "Анжелина2")!,
                   UIImage (named: "Анжелина3")!]),
      VKUser (nameFriend: "Николь Кидман",
              avatar: UIImage (named: "avatar4")!,
              userPhoto:
                [UIImage (named: "Николь1")!,
                 UIImage (named: "Николь2")!,
                 UIImage (named: "Николь3")!]),]
var mygroup: [VKGroup] = []
var globalGroup: [VKGroup] = []
var myNews: [VKNews] = []
