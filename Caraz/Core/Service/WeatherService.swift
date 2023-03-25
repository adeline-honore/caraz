//
//  WeatherService.swift
//  Caraz
//
//  Created by HONORE Adeline on 24/03/2023.
//

import Foundation

class WeatherService: WeatherServiceProtocol {
    
    private var network: NetworkProtocol
        
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    func getData(city: Int,completionHandler: @escaping (Result<WeatherStructure, Error>) -> ()) {
        
        network.callNetwork(router: WeatherRouter.getWeather(cityID: city)) { result in
            
            switch result {
            case .success(let data):
                let weather = self.transformToWeatherStructure(data: data)
                completionHandler(.success(weather))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    private func transformToWeatherStructure(data: Data) -> WeatherStructure {
        var responseWeather: WeatherStructure
        responseWeather = try! JSONDecoder().decode(WeatherStructure.self, from: data)
        return responseWeather
    }
}
