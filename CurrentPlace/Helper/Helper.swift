//
//  Helper.swift
//  CurrentPlace
//
//  Created by Angelos Staboulis on 25/4/24.
//

import Foundation
import CoreLocation
actor Helper{
    func fetchCoordinates(manager:CLLocationManager) async -> CLLocationCoordinate2D{
        return await withCheckedContinuation { continuation in
            guard let location = manager.location else {
                return
            }
            continuation.resume(returning: location.coordinate)
        }
        
    }

}
