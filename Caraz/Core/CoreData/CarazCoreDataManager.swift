//
//  CarazCoreDataManager.swift
//  Caraz
//
//  Created by HONORE Adeline on 25/03/2023.
//

import CoreData

final class CarazCoreDataManager {
    
    // MARK: - Properties
    
    private let coreDataStack: CoreDataStack
    let managedObjectContext: NSManagedObjectContext
    
    // MARK: - Init
    
    public init(coreDataStack: CoreDataStack, managedObjectContext: NSManagedObjectContext) {
        self.coreDataStack = coreDataStack
        self.managedObjectContext = managedObjectContext
    }
    
    func createEntity(carUI: CarUI) throws {
        
    }
}
