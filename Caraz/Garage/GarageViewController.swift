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
    private var pickerViewArray: [String] = []
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        garageView = view as? GarageView
        configureView()
        
        UserDefaults.standard.value(forKey: "carChoosen")
        showCar()
        
        
        configurePickerView()
    }
    
    
    private func configureView() {
        garageView.welcomeLabel.text = Texts.welcomeLabelText.rawValue
        garageView.actionLabel.text = Texts.actionLabelText.rawValue
        
    }
    
    private func configurePickerView() {
        
        pickerViewArray.append("- Choisissez -")
        
        pickerViewArray.append("r")
        pickerViewArray.append("m")
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
    
    @IBAction func didTapWeatherButton() {
        
    }
    
    private func chooseCarAccordingToTheWeather() {
        
    }
    
    
    
    
}


// MARK: - PickerView

extension GarageViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewArray.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if row != 0 {
            UserDefaults.standard.set(pickerViewArray[row], forKey: "carChoosen")
        }
    }
}
