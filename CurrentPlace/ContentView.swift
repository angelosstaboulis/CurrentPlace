//
//  ContentView.swift
//  CurrentPlace
//
//  Created by Angelos Staboulis on 20/4/24.
//

import SwiftUI
import CoreLocation
import CoreLocationUI
import MapKit
struct ContentView: View {
    @StateObject var manager = LocationManager()
    @StateObject var viewModel = PlaceViewModel()
    @State var placeModel:PlaceDetails
    @State var location:CLLocationCoordinate2D
    var body: some View {
        VStack{
            HStack{
                Text("Current Place")
            }.frame(width:350,height:45,alignment: .top)
            VStack{
                VStack{
                    Text("Address =  "+self.placeModel.address)
                }.frame(width:350,height:45,alignment: .leading)
                VStack{
                    Text("Town =  "+self.placeModel.town)
                }.frame(width:350,height:45,alignment: .leading)
                VStack{
                    Text("Region =  "+self.placeModel.region)
                }.frame(width:350,height:45,alignment: .leading)
                VStack{
                    Text("Country =  "+self.placeModel.country)
                }.frame(width:350,height:45,alignment: .leading)
                Spacer()
                VStack{
                    Button(action: {
                        manager.startUpdatingLocation()
                        
                    }, label: {
                        Text("Update Location")
                    })
                }.frame(width:350,height:45,alignment: .center)
                VStack{
                    MapView(coordinate:.constant(CLLocationCoordinate2D(latitude: self.location.latitude, longitude: self.location.longitude)))
                        .onReceive(self.manager.location.publisher, perform: { value in
                            Task{
                                self.location = await viewModel.fetchCoordinates(manager: manager.manager)
                            }
                            let geocoder = CLGeocoder()
                            geocoder.reverseGeocodeLocation(CLLocation(latitude: location.latitude, longitude: location.longitude)) { placemarks, error in
                                if let error = error as? CLError {
                                    print("CLError:", error)
                                    return
                                } else if let placemarkGet = placemarks {
                                    if let placemark = placemarkGet.first{
                                        guard let address = placemark.name else {
                                            return
                                        }
                                        guard let town = placemark.locality else {
                                            return
                                        }
                                        guard let country = placemark.country else {
                                            return
                                        }
                                        guard let region = placemark.administrativeArea else {
                                            return
                                        }
                                        placeModel = PlaceDetails(address: address, town: town, country: country, region: region)
                                      
                                    }
                                }
                            }
                        })
                    
                }
            }
        }
    }
    
}

#Preview {
    ContentView(manager: .init(), placeModel: .init(address: "", town: "", country: "", region: ""), location: .init())
}
