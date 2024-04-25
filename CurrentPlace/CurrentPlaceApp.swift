//
//  CurrentPlaceApp.swift
//  CurrentPlace
//
//  Created by Angelos Staboulis on 20/4/24.
//

import SwiftUI

@main
struct CurrentPlaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(manager: .init(),placeModel: .init(address: "", town: "", country: "", region: ""), location: .init())
        }
    }
}
