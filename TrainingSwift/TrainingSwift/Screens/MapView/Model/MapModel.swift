//
//  MapViewModel.swift
//  TrainingSwift
//
//  Created by Ashwin A U on 04/05/23.
//

import Foundation
import MapKit

struct MapModel: Identifiable {
    var id = UUID()
    var city: String
    var latitude: Double
    var longitude: Double
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
