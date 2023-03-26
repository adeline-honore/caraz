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
    
    private let logo = UIImage(imageLiteralResourceName: "logo")
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        garageView = view as? GarageView
        
        // first start
        if !UserDefaults.standard.bool(forKey: "ExecuteOnce") {
            executeOnce()
            UserDefaults.standard.set(true, forKey: "ExecuteOnce")
        }
        
        UserDefaults.standard.value(forKey: "carChoosen")
        
        getCars()
        configurePickerView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showCar()
    }
    
    // MARK: - get cars from Core Data
    private func executeOnce() {
        
        // creation of the two cars
        let anaconda = CarUI(id: "AAA-BBB-CCC", name: "anaconda", brand: "mercedes", tankAutonomy: 800, picture: UIImage(named: "anaconda-mercedes") ?? logo, convertible: false)
        
        let grandCabrio = CarUI(id: "DDD-EEE-GGG", name: "grandCabrio", brand: "maserati", tankAutonomy: 1200, picture: UIImage(named: "grandCabrio-maserati") ?? logo, convertible: true)
        
        do {
            try repository.createEntity(carUI: anaconda)
            try repository.createEntity(carUI: grandCabrio)
            
        } catch {
            print("error to save cars into Core Data")
        }
        
        performSegue(withIdentifier: SegueIdentifier.fromGarageToPresentation.rawValue, sender: nil)
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
    
    // MARK: - Configure view & UserDefaults
    
    private func configurePickerView() {
        
        pickerViewArray.append("- Choisissez -")
        
        carsUI.forEach { car in
            pickerViewArray.append(car.name)
        }
    }
        
    private func showCar() {
        garageView.configureView()
        
        if UserDefaults.standard.value(forKey: "carChoosen") != nil {
            garageView.choiceLabel.text = Texts.startChoiceLabel.rawValue
            garageView.choiceImage.image = carsUI.first(where: {$0.name == UserDefaults.standard.value(forKey: "carChoosen") as! String})?.picture
        } else {
            garageView.choiceLabel.text = Texts.noChoosenCar.rawValue
            garageView.choiceImage.isHidden = true
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
