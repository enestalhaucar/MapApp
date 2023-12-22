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
    let maxWidthForIpad : CGFloat = 700
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            VStack(spacing : 0 ) {
                header
                    .padding()
                    .frame(maxWidth: maxWidthForIpad)
                Spacer()
                previewOfLocation
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
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
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("Text"))
                    .frame(height: 55)
                    .animation(.none, value: vm.mapLocation)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundStyle(Color("Text"))
                        .padding()
                        .rotationEffect(Angle(degrees: vm.showLocationList ? -180 : 0))
                }
            }
            
            
            if vm.showLocationList {
                LocationsListView()
            }
            
            
            
            
        }.background(.ultraThickMaterial)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    
    private var mapLayer : some View {
        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
            
        })
    }
    
    
    
    private var previewOfLocation : some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxWidth: .infinity)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .bottom)))
                }
                
            }
        }
    }
}
