//
//  LocationsViewModel.swift
//  MapAppSwiftUI
//
//  Created by Enes Talha Uçar  on 21.12.2023.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel : ObservableObject {
    
    // All Loaded Locations
    @Published var locations : [Location]
    // Current location on map
    @Published var mapLocation : Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    
    
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    
    // ShowList of locations
    
    @Published var showLocationList : Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location : Location) {
        withAnimation(.linear) {
            mapRegion = MKCoordinateRegion(center: location.coordinates,span: mapSpan)
        }
        
            
        
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    
    }
    
}
