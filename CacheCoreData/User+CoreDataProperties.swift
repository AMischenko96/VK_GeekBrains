//
//  User+CoreDataProperties.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 28.03.2022.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var age: Int64

}

extension User : Identifiable {

}
