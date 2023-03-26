//
//  CarViewController.swift
//  Caraz
//
//  Created by HONORE Adeline on 26/03/2023.
//

import UIKit

class CarViewController: UIViewController {
    
    // MARK: - Properties
    
    var carUI: CarUI?
    private var carView: CarView!
    
    private let repository = CarazCoreDataManager(
        coreDataStack: CoreDataStack(),
        managedObjectContext: CoreDataStack().viewContext)
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carView = view as? CarView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        guard let carUI = carUI else {
            return
        }
        carView.configure(car: carUI)
    }
    
}
