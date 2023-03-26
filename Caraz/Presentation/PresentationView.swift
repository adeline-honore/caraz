//
//  PresentationView.swift
//  Caraz
//
//  Created by HONORE Adeline on 26/03/2023.
//

import UIKit

class PresentationView: UIView {
    
    // MARK: - Properties
    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var explainLabel: UILabel!
    
    // MARK: - Configure
    
    func configureView(logoValue: UIImage, welcomeValue: String, explainValue: String) {
        logoImage.image = logoValue
        welcomeLabel.text = welcomeValue
        explainLabel.text = explainValue
    }
}
