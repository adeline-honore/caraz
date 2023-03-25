//
//  GarageView.swift
//  Caraz
//
//  Created by HONORE Adeline on 24/03/2023.
//

import UIKit

class GarageView: UIView {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var choiceLabel: UILabel!
    
    @IBOutlet weak var choiceImage: UIImageView!
    
    @IBOutlet weak var actionLabel: UILabel!
    
    @IBOutlet weak var choicePickerView: UIPickerView!
    
    @IBOutlet weak var wheatherButton: UIButton!
    
    
    func configureView() {
        welcomeLabel.text = Texts.welcomeLabelText.rawValue
        actionLabel.text = Texts.actionLabelText.rawValue
        wheatherButton.titleLabel?.text = Texts.weatherButton.rawValue
    }
}
