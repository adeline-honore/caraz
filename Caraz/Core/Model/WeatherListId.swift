//
//  WeatherListId.swift
//  Caraz
//
//  Created by HONORE Adeline on 24/03/2023.
//

import Foundation


struct WeatherListId: Decodable {
    
    let id: Int
    let name: String
    let state: String
    let country: String
    let coord: Coord
    
    struct Coord: Decodable {
        let lon: Double
        let lat: Double
    }
}
