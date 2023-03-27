//
//  Extension+CLLocation.swift
//  Caraz
//
//  Created by HONORE Adeline on 27/03/2023.
//

import MapKit

extension CLLocation {
    func geocode(completion: @escaping (_ placemark: [CLPlacemark]?, _ error: Error?) -> Void) {
        CLGeocoder().reverseGeocodeLocation(self, completionHandler: completion)
    }
}
