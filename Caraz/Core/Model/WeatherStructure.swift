//
//  WeatherStructure.swift
//  Caraz
//
//  Created by HONORE Adeline on 24/03/2023.
//

import Foundation

struct WeatherStructure: Decodable {
    
    struct Coord: Decodable {
        let lon: Double
        let lat: Double
    }
    
    let coord: Coord
    
    struct Weather: Decodable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    
    let weather: [Weather]
    
    struct Main: Decodable {
        let temp: Double
        let humidity: Int
    }
    
    let main: Main
    
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
    
}
