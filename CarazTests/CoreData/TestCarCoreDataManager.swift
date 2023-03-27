//
//  TestCarCoreDataManager.swift
//  CarazTests
//
//  Created by HONORE Adeline on 27/03/2023.
//

import XCTest
import CoreData
@testable import Caraz

final class TestCarCoreDataManager: XCTestCase {

    var coreDataManager: CarazCoreDataManager!
    var coreDataStack: CoreDataStack!
    
    let logo = UIImage(imageLiteralResourceName: "logo")
    
    override func setUpWithError() throws {
        coreDataStack = TestCoreDataStack()
        coreDataManager = CarazCoreDataManager(
            coreDataStack: coreDataStack,
            managedObjectContext: coreDataStack.viewContext
        )
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        coreDataStack = nil
        coreDataManager = nil
        try super.tearDownWithError()
    }
    
    func testGetCars() {
        
        let carUI: CarUI = CarUI(id: "monId", name: "sonNom", brand: "saMarque", tankAutonomy: 12000, picture: logo, convertible: true)
        
        do {
            try coreDataManager.createEntity(carUI: carUI)
            let cars = try coreDataManager.getEntities()
            XCTAssertNotNil(cars)
            XCTAssertTrue(cars.count == 1)
        } catch {
            print("error, tests fails !")
        }
    }
    
    
    
    func testSetEntity() {
        
        let carUI: CarUI = CarUI(id: "monId", name: "sonNom", brand: "saMarque", tankAutonomy: 12000, picture: logo, convertible: true)
        
        var carSetted: CarUI = CarUI(id: "monId", name: "sonNom", brand: "saMarque", tankAutonomy: 12000, picture: logo, convertible: true)
        
        carSetted.distanceTraveled = 540
        
        do {
            try coreDataManager.createEntity(carUI: carUI)
            try coreDataManager.setEntity(carUI: carSetted)
            
            XCTAssertTrue(carSetted.distanceTraveled == 540)
        } catch {
            print("error, tests fails !")
        }
    }
    
}
