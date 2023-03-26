//
//  CarUI.swift
//  Caraz
//
//  Created by HONORE Adeline on 24/03/2023.
//

import UIKit

struct CarUI {
    
    var id: String
    var name: String
    var brand: String
    var tankAutonomy: Double
    var distanceTraveled: Double?
    var picture: UIImage
    var convertible: Bool
    
    var pictureBinary: Data {
        picture.jpegData(compressionQuality: 1)!
    }
    
    
    // MARK: - Init
    init(id: String,
         name: String,
         brand: String,
         tankAutonomy: Double,
         picture: UIImage,
         convertible: Bool) {
        self.id = id
        self.name = name
        self.brand = brand
        self.tankAutonomy = tankAutonomy
        self.picture = picture
        self.convertible = convertible
    }
    
    
    init(carCD: CarCD) {
        self.id = carCD.id ?? ""
        self.name = carCD.name ?? ""
        self.brand = carCD.brand ?? ""
        self.tankAutonomy = carCD.tankAutonomy
        self.distanceTraveled = carCD.distanceTraveled
        self.picture = UIImage(data: carCD.pictureBianry!) ?? UIImage()
        self.convertible = carCD.convertible
    }
    
    var progressDecimal: Float {
        guard let distanceTraveled = distanceTraveled else { return 0 }
        
        return Float(1 - (distanceTraveled / tankAutonomy))
    }
}
