//
//  WeatherViewController.swift
//  Caraz
//
//  Created by HONORE Adeline on 24/03/2023.
//

import UIKit
import MapKit

class WeatherViewController: UIViewController {
    
    // MARK: - Properties
    private var weatherView: WeatherView!
    private var weatherService: WeatherServiceProtocol = WeatherService(network: Network())
    private var locationManager = LocationManager.shared
    private var userLocation: CLLocation = CLLocation()
    var carsUI: [CarUI] = []
    private var carUI: CarUI?
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherView = view as? WeatherView
        
        locationManager.locationManagerDelegate = self
        locationManager.getUserGeoLocation()
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
                self.update(weatherDecode: weather)
            case .failure:
                print("oups  ")
            }
        }
    }
    
    private func update(weatherDecode: WeatherStructure) {
        
        DispatchQueue.main.async { [weak self] in
            
            guard let self = self,
                  let icon = weatherDecode.weather.first?.icon,
                  let weatherImage = UIImage(named: weatherDecode.weather.first?.icon ?? "01d") else { return }
            
            self.weatherView.configureWeatherOutlet(welcomeValue: weatherDecode.name,
                                               imageValue: weatherImage,
                                               temperatureValue: self.kelvinToCelsius(kelvin: weatherDecode.main.temp),
                                               detailsValue: weatherDecode.weather.first?.description ?? "pas d'autre details")
            
            // display car according to the weather
            self.carUI = self.displayCarAccordingToTheWeather(weatherIcon: icon)
            UserDefaults.standard.set(self.carUI?.name, forKey: "carChoosen")
            
            guard let car = self.carUI else { return }
            
            self.weatherView.configureCarOutlet(nameValue: car.name, imageValue: car.picture)
        }
    }
    
    private func kelvinToCelsius(kelvin: Double) -> String {
        return String(format:"%.1f", (kelvin - 273.15)) + " °C"
    }
    
    
    private func displayCarAccordingToTheWeather(weatherIcon: String) -> CarUI? {
        var car: CarUI?
        
        if weatherIcon == "01d" || weatherIcon == "02d" {
            car = carsUI.first(where: {$0.convertible == true})
            return car
        } else {
            car = carsUI.first(where: {$0.convertible == false})
            return car
        }
    }
    
    // MARK: Get user location
    
    private func getLoactionId(lon: CLLocationDegrees, lat: CLLocationDegrees) {
        
        let loc = CLLocation(latitude: lat, longitude: lon)
        
        loc.geocode { placemark, error in
            
            if let error = error as? CLError {
                print("CLError:", error)
                return
            } else if let placemark = placemark?.first {
                DispatchQueue.main.async {
                    guard let city = placemark.locality else { return }
                    
                    self.showWeatherInformations(city: self.getIdLocality(locality: city))
                }
            }
        }
    }
    
    private func getIdLocality(locality: String) -> Int {
        
        // Access to json file for id
        let bundle = Bundle(for: WeatherViewController.self)
        
        guard let url = bundle.url(forResource: "city-list-FR", withExtension: "json") else {
            return 0 }
        
        let data = try! Data(contentsOf: url)
        
        let listId = transformToWeatherListId(data: data)
        
        // get locality's id
        guard let place = listId.first(where: {$0.name == locality}) else { return 0}
        
        return place.id
    }
    
    private func transformToWeatherListId(data: Data) -> [WeatherListId] {
        var responseWeather: [WeatherListId]
        responseWeather = try! JSONDecoder().decode([WeatherListId].self, from: data)
        return responseWeather
    }
}


extension WeatherViewController: LocationManagerDelegate {
    func accessUserCoordinate(_ location: CLLocation) {
        userLocation = location
        
        getLoactionId(lon: userLocation.coordinate.longitude, lat: userLocation.coordinate.latitude)
    }
}
