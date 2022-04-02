//
//  CoreDataService.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 14.03.2022.
//

import CoreData

class CoreDataService {
    
    let coreDataService = CoreDataService()
    lazy var persistantContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CacheCoreData")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("error")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistantContainer.viewContext
    }
    
        func saveUser() {
            let context = coreDataService.persistantContainer.viewContext
            let newUser = User(context: context)
            
            newUser.firstName = "Leon"
            newUser.lastName = "Ceed"
            newUser.age = 24
        }
    
    
    func saveContext() {
        let context = persistantContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("error context\(nserror), \(nserror.userInfo), \(nserror.code)")
            }
        }
    }
}
