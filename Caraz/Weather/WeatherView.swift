//
//  WeatherView.swift
//  Caraz
//
//  Created by HONORE Adeline on 24/03/2023.
//

import UIKit

class WeatherView: UIView {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    
    @IBOutlet weak var carImage: UIImageView!
    
    @IBOutlet weak var carNameLabel: UILabel!
    
    
    func configureWeatherOutlet(welcomeValue: String,
                   imageValue: UIImage,
                   temperatureValue: String,
                   detailsValue: String) {
        welcomeLabel.text = "Bienvenue. Aujourd'hui à " + welcomeValue + " le temps est :"
        iconImage.image = imageValue
        temperatureLabel.text = temperatureValue
        detailsLabel.text = detailsValue
    }
}
