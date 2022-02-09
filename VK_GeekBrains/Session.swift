//
//  Session.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 13.01.2022.
//

import UIKit

class Session {
    static let shared = Session()
    
    private init(){ }
    
    // var token: String = "a9c4d286a9c4d286a9c4d28672a9be304faa9c4a9c4d286c821a2eeb8daa27c10dda027"
    //var userId: Int = 8053449
    var token: String?
    var userId: Int?
}
