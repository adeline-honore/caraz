//
//  GarageViewController.swift
//  Caraz
//
//  Created by HONORE Adeline on 23/03/2023.
//

import UIKit

class GarageViewController: UIViewController {
    
    // MARK: - Properties
    
    private var garageView: GarageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        garageView = view as? GarageView
        configView()
        
        UserDefaults.standard.value(forKey: "carChoosen")
        showCar()
    }
    
    
    func configView() {
        garageView.welcomeLabel.text = Texts.welcomeLabelText.rawValue
        garageView.actionLabel.text = Texts.actionLabelText.rawValue
        
    }
    
    // MARK: - UserDefaults
    
    private func showCar() {
        
        if UserDefaults.standard.value(forKey: "carChoosen") != nil {
            garageView.choiceLabel.text = Texts.startChoiceLabel.rawValue
        } else {
            garageView.choiceLabel.text = Texts.noChoosenCar.rawValue
        }
        
        
    }
    
    
    // MARK: - Choose the car
    

    

}
