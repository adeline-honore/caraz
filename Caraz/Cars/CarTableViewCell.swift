//
//  CarTableViewCell.swift
//  Caraz
//
//  Created by HONORE Adeline on 26/03/2023.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets & properties
    
    @IBOutlet weak var carImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailsImage: UIImageView!
    
    static let identifier = "CarTableViewCell"
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.frame = bounds
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(car: CarUI) {
        carImage.image = car.picture
        nameLabel.text = car.name
    }
}
