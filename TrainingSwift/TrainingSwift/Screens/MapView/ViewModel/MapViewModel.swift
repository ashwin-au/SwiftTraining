//
//  MapViewModel.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 04/05/23.
//

import Foundation
import MapKit

class MapViewModel: ObservableObject {
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 13.0827, longitude: 80.2707), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    var location = [
        MapModel(city: "Chennai", latitude: 13.0827, longitude: 80.2707),
        MapModel(city: "Kochi", latitude: 9.9312, longitude: 76.2673),
        MapModel(city: "Goa", latitude: 15.2993, longitude: 74.1240),
        MapModel(city: "Bangalore", latitude: 12.9716, longitude: 77.5946),
        MapModel(city: "Hyderabad", latitude: 17.366, longitude: 78.476),
        MapModel(city: "kanyakumari", latitude: 8.0883, longitude: 77.5385)
        ]
}
