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
        getCars()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
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
    
    // MARK: - Configure Table View
    
    private func configureTableView() {
        let cellNib = UINib(nibName: CarTableViewCell.identifier, bundle: .main)
        tableView.register(cellNib, forCellReuseIdentifier: CarTableViewCell.identifier)
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
    }
}
