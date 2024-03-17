//
//  HomeViewController + Location.swift
//  WeatherApp
//
//  Created by Systems on 16/03/2024.
//

import Foundation
import CoreLocation

extension HomeViewController: CLLocationManagerDelegate {
    func getUserLocation() {
        locManager.requestWhenInUseAuthorization()
         locManager.delegate = self
         locManager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Swift.Error) {
        print(error)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print(location.coordinate.latitude)
            print(location.coordinate.longitude)
            presenter.getHomeData(lat: "\(location.coordinate.latitude)", long: "\(location.coordinate.longitude)")
        }
    }
}
