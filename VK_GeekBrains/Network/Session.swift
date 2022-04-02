//
//  Session.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 13.01.2022.
//

import UIKit

class Session {
    
    static let instance = Session()
    
    private init(){ }
    
    var token: String?
    var userId: Int?
    
}
