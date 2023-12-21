//
//  Location.swift
//  MapAppSwiftUI
//
//  Created by Enes Talha Uçar  on 21.12.2023.
//

import Foundation
import MapKit

struct Location : Identifiable {
    let name : String
    let cityName : String
    let coordinates : CLLocationCoordinate2D
    let description : String
    let imageNames : [String]
    let link : String
    // Identifiable 
    var id : String {
        name + cityName
    }
    
}
