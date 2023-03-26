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
    
    // MARK: Update distance traveled
    
    @IBAction func didTapUpdateButton() {
        
        showInputDialog(title: "Entrer un nombre", subtitle: nil, actionTitle: "Mettre à jour", cancelTitle: "Cancel", inputPlaceholder: "Entrer un kilomètrage", inputKeyboardType: .numberPad, cancelHandler: nil, actionHandler: nil)
    }
    
    private func updateDistance(distance: String?) {
        
        guard let distance = distance else { return }
        
        if !distance.isEmpty {
            do {
                carUI?.distanceTraveled = Double(distance)
                guard let car = carUI else { return }
                try repository.setEntity(carUI: car)
            } catch {
                print("error updateDistance")
            }
        }
        
    }
}


extension CarViewController {
    
    func showInputDialog(title:String? = nil,
                         subtitle: String? = nil,
                         actionTitle: String,
                         cancelTitle: String,
                         inputPlaceholder: String,
                         inputKeyboardType:UIKeyboardType = UIKeyboardType.default,
                         cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil,
                         actionHandler: ((_ text: String?) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = inputPlaceholder
            textField.keyboardType = inputKeyboardType
        }
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (action:UIAlertAction) in
            guard let textField =  alert.textFields?.first else {
                actionHandler?(nil)
                return
            }
            actionHandler?(textField.text)
            self.updateDistance(distance: textField.text)
        }))
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler))
        
        self.present(alert, animated: true, completion: nil)
    }
}
