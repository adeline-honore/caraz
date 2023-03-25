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
        
        let entity = NSEntityDescription.entity(forEntityName: "CarCD",
                                                in: coreDataStack.viewContext)!
        
        let carCD = NSManagedObject(entity: entity, insertInto: coreDataStack.viewContext)
        
        carCD.setValue(carUI.id, forKey: "id")
        carCD.setValue(carUI.name, forKey: "name")
        carCD.setValue(carUI.brand, forKey: "brand")
        carCD.setValue(carUI.tankAutonomy, forKey: "tankAutonomy")
        carCD.setValue(carUI.distanceTraveled, forKey: "distanceTraveled")
        carCD.setValue(carUI.pictureBinary, forKey: "pictureBianry")
        carCD.setValue(carUI.convertible, forKey: "convertible")
        
        try coreDataStack.viewContext.save()
    }
    
    
    func getEntities() throws -> [CarCD] {
            let request: NSFetchRequest<CarCD> = CarCD.fetchRequest()
            do {
                return try coreDataStack.viewContext.fetch(request)
            } catch {
                throw error
            }
        }
}
