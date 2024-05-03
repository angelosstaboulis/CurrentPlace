//
//  PlaceViewModel.swift
//  CurrentPlace
//
//  Created by Angelos Staboulis on 25/4/24.
//

import Foundation
import CoreLocation
@MainActor
class PlaceViewModel:ObservableObject{
    let helper = Helper()
    func fetchCoordinates(manager:CLLocationManager) async  ->CLLocationCoordinate2D {
        return await helper.fetchCoordinates(manager: manager)
    }
}
