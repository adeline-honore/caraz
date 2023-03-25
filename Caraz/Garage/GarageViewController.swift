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
    
    private let repository = CarazCoreDataManager(
        coreDataStack: CoreDataStack(),
        managedObjectContext: CoreDataStack().viewContext)
    private var carsUI: [CarUI] = []
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        garageView = view as? GarageView
        configureView()
        
        UserDefaults.standard.value(forKey: "carChoosen")
        showCar()
        configurePickerView()
        
        getCars()
        
        // to save a new car
//        saveCarIntoCoreData()
    }
    
    // MARK: - get cars from Core Data
    
    func getCars() {
        do {
            let carsCD = try repository.getEntities()
            carsUI = carsCD.map { CarUI(carCD: $0)}
        } catch {
            print("error to get cars from Core Data")
        }
    }
    
    // MARK: - Configure view
    
    private func configureView() {
        garageView.welcomeLabel.text = Texts.welcomeLabelText.rawValue
        garageView.actionLabel.text = Texts.actionLabelText.rawValue
        garageView.wheatherButton.titleLabel?.text = Texts.weatherButton.rawValue
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
        sendCarsUI()
    }
    
    func sendCarsUI() {
        performSegue(withIdentifier: SegueIdentifier.fromGarageToWeather.rawValue, sender: nil)
    }
    
    // MARK: - Send informations thanks segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.fromGarageToWeather.rawValue {
            let viewController = segue.destination as? WeatherViewController
            viewController?.carsUI = carsUI
        }
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


extension GarageViewController {
    func saveCarIntoCoreData() {
        
        guard let image = UIImage(named: "") else { return }
        
        let carToSave: CarUI = CarUI(id: "",
                              name: "",
                              brand: "",
                              tankAutonomy: 1200,
                              picture: image,
                              convertible: true)
        
        do {
            try self.repository.createEntity(carUI: carToSave)
        } catch {
            print("error to save into Core Data")
        }
    }
}
