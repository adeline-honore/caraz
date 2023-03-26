//
//  Texts.swift
//  Caraz
//
//  Created by HONORE Adeline on 24/03/2023.
//

import Foundation

enum Texts: String {
    
    // MARK: Presentation
    case welcomePresentation = "Bienvenue sur l'application Caraz"
    case explainPresentation = "Grâce à elle, vous pourrez choisir votre voiture en fonction de la météo, et avoir un suivi de votre voiture."
    
    // MARK: Garage
    case welcomeLabelText = "Bienvenue"
    case actionLabelText = "Choisir une voiture entre :"
    
    case noChoosenCar = "Oups ! Aucune voiture pré - sélectionnée"
    case startChoiceLabel = "Votre voiture sélectionnée est :"
    
    case weatherButton = "Choisir une voiture en fonction du temps"
    
    // MARK: Cars
    case titleForHeaderInSection = "Vos voitures"
    
    // MARK: Car
    case progressLabel1 = "Vous avez parcouru "
    case progressLabel2 = " km. Votre reservoir est donc rempli à "
    
    case updateButton = "Mettre à jour mon parcours"
}
