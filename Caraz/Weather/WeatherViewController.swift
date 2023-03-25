//
//  WeatherViewController.swift
//  Caraz
//
//  Created by HONORE Adeline on 24/03/2023.
//

import UIKit

class WeatherViewController: UIViewController {
    
    // MARK: - Properties
    private var weatherView: WeatherView!
    private var weatherService: WeatherServiceProtocol = WeatherService(network: Network())
    private var placeId: Int = 0
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherView = view as? WeatherView
        
        // Geo location to Paris for now
        getLoactionId(lon: 2.3486, lat: 48.853401)
        
        showWeatherInformations(city: placeId)
    }
    
    // MARK: - Cancel Pop Up
    
    @IBAction func didTapCancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Display weather informations
    
    private func showWeatherInformations(city: Int) {
        
        weatherService.getData(city: city) { result in
            switch result {
            case .success(let weather):
                print(weather)
            case .failure:
                print("oups  ")
            }
        }
    }
    
    // MARK: Get user location
    
    private func getLoactionId(lon: Double, lat: Double) {
        
        // Access to json file for id
        let bundle = Bundle(for: WeatherViewController.self)
        
        guard let url = bundle.url(forResource: "city-list-FR", withExtension: "json") else { return }
        
        let data = try! Data(contentsOf: url)
        
        let listId = transformToWeatherListId(data: data)
        
        listId.forEach { place in
            if (place.coord.lat == lat) && (place.coord.lon == lon) {
                print(place.name)
                print(place.id)
                placeId = place.id
            }
        }
    }
    
    private func transformToWeatherListId(data: Data) -> [WeatherListId] {
        var responseWeather: [WeatherListId]
        responseWeather = try! JSONDecoder().decode([WeatherListId].self, from: data)
        return responseWeather
    }
    
    
}
