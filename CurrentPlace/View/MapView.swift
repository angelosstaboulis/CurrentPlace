//
//  MapView.swift
//  CurrentPlace
//
//  Created by Angelos Staboulis on 20/4/24.
//

import Foundation
import SwiftUI
import MapKit
struct MapView:UIViewRepresentable{
    @Binding var coordinate:CLLocationCoordinate2D
    var mapView =  MKMapView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.camera = MKMapCamera(lookingAtCenter: coordinate, fromEyeCoordinate: coordinate, eyeAltitude: .zero)
        if uiView.annotations.count < 6 {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "Current Address"
            uiView.addAnnotation(annotation)
        }
          
    }
 
    func makeUIView(context: Context) ->  MKMapView {
    
        return mapView
    }
}
