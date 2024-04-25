//
//  LocationManager.swift
//  CurrentPlace
//
//  Created by Angelos Staboulis on 20/4/24.
//

import Foundation
import MapKit
class LocationManager:NSObject,ObservableObject,CLLocationManagerDelegate{
    var manager = CLLocationManager()
    @Published var location:CLLocationCoordinate2D?
    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
    }
    func startUpdatingLocation(){
        manager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locationCoordinate = locations.first else{
            return
        }
        location = locationCoordinate.coordinate
        manager.stopUpdatingLocation()
    }
}
