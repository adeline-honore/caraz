//
//  CarView.swift
//  Caraz
//
//  Created by HONORE Adeline on 26/03/2023.
//

import UIKit

class CarView: UIView {
    
    // MARK: - Properties
    
    @IBOutlet weak var pictureImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    //MARK: - Init
    
    func configure(car: CarUI) {
        
        guard let distance = car.distanceTraveled else { return }
        
        pictureImage.image = car.picture
        nameLabel.text = car.name + "( " + car.brand + " )"
        
        progressLabel.text = Texts.progressLabel1.rawValue + String(format: "%.0f", distance) + Texts.progressLabel2.rawValue + car.progress + " %."
    }
}
