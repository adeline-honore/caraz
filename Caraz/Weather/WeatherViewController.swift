//
//  WeatherViewController.swift
//  Caraz
//
//  Created by HONORE Adeline on 24/03/2023.
//

import UIKit

class WeatherViewController: UIViewController {
    
    // MARK: - Properties
    private var weatherView: WeatherView!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherView = view as? WeatherView
    }
    
    // MARK: - Cancel Pop Up
    
    @IBAction func didTapCancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
