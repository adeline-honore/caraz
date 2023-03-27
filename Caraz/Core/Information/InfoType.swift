//
//  InfoType.swift
//  Caraz
//
//  Created by HONORE Adeline on 27/03/2023.
//

import Foundation

enum InfoType {
    case noUpdateDistance
    case noGetCars
    case noCarSaved
    case noGetWeather
    case noLocationDecoded
    
    var message: String {
        switch self {
        case .noUpdateDistance:
            return "Oups ! la distance n'a pas pu être mise à jour."
        case .noGetCars:
            return "Oups ! Impossible de télécharger les voitures."
        case .noCarSaved:
            return "Oups ! impossible de sauvegarder les voitures."
        case .noGetWeather:
            return "Oups ! impossible de télécharger la météo."
        case .noLocationDecoded:
            return "Oups ! impossible de trouver le lieu"
        }
    }
}
