//
//  MapViewController.swift
//  Caraz
//
//  Created by HONORE Adeline on 25/03/2023.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var mapView: MKMapView!
    
    private var locationManager = LocationManager.shared
    private var userLocation: CLLocation = CLLocation()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.locationManagerDelegate = self
        locationManager.getUserGeoLocation()
    }
    
    // MARK: - Initial Location on Map
    
    private func setInitialLocation() {
        mapView.centerToLocation(userLocation)
    }
}

extension MapViewController: MKMapViewDelegate {}


extension MapViewController: LocationManagerDelegate {
    func accessUserCoordinate(_ location: CLLocation) {
        userLocation = location
        
        // Set initial location center on user's location
        setInitialLocation()
        
        // display user location point
        mapView.showsUserLocation = true
    }
}
