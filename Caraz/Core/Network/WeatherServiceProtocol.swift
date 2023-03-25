//
//  WeatherServiceProtocol.swift
//  Caraz
//
//  Created by HONORE Adeline on 24/03/2023.
//

import Foundation

protocol WeatherServiceProtocol {
    func getData(city: Int, completionHandler: @escaping (Result<WeatherStructure, Error>) -> ())
}
