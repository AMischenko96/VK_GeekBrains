//
//  Photo+CoreDataProperties.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 28.03.2022.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var avatar: URL?

}

extension Photo : Identifiable {

}
