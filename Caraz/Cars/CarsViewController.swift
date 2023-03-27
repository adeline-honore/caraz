//
//  CarsViewController.swift
//  Caraz
//
//  Created by HONORE Adeline on 26/03/2023.
//

import UIKit

class CarsViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    private let repository = CarazCoreDataManager(
        coreDataStack: CoreDataStack(),
        managedObjectContext: CoreDataStack().viewContext)
    private var carsUI: [CarUI] = []
    private var carUI: CarUI?
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getCars()
        configureTableView()
        tableView.reloadData()
    }
    
    // MARK: - get cars from Core Data
    
    func getCars() {
        do {
            let carsCD = try repository.getEntities()
            carsUI = carsCD.map { CarUI(carCD: $0)}
        } catch {
            informationMessage(element: .noGetCars)
        }
    }
    
    // MARK: - Configure Table View
    
    private func configureTableView() {
        let cellNib = UINib(nibName: CarTableViewCell.identifier, bundle: .main)
        tableView.register(cellNib, forCellReuseIdentifier: CarTableViewCell.identifier)
    }
    
    // MARK: - View details of car
    
    func sendCarUI() {
        performSegue(withIdentifier: SegueIdentifier.fromCarsToCar.rawValue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.fromCarsToCar.rawValue {
            let viewController = segue.destination as? CarViewController
            viewController?.carUI = carUI
        }
    }
}

extension CarsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Texts.titleForHeaderInSection.rawValue
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.width / 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carsUI.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier) as? CarTableViewCell ?? CarTableViewCell()
        cell.configure(car: carsUI[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        carUI = carsUI[indexPath.row]
        sendCarUI()
    }
}
