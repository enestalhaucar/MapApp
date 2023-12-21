//
//  LocationView.swift
//  MapAppSwiftUI
//
//  Created by Enes Talha Uçar  on 21.12.2023.
//

import SwiftUI
import MapKit


struct LocationView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    @State private var mapRegion : MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.9009, longitude: 12.4833),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            
            VStack(spacing : 0 ) {
                header.padding()
                Spacer()
            }
            
        }
    }
}

#Preview {
    LocationView()
        .environmentObject(LocationsViewModel())
}

extension LocationView {
    
    private var header : some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .frame(height: 55)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .padding()
                }
            }
            
            
            if vm.showLocationList {
                LocationsListView()
            }
            
            
            
            
        }.background(.ultraThickMaterial)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
        
    }
}
