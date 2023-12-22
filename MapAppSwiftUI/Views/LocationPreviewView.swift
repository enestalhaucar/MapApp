//
//  LocationPreviewView.swift
//  MapAppSwiftUI
//
//  Created by Enes Talha Uçar  on 21.12.2023.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var vm : LocationsViewModel
    
    let location : Location
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            
            VStack(spacing : 8 ) {
                learnMoreButton
                nextButton
            }
        }.padding(20)
            .background(
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(.ultraThinMaterial)
                    .offset(y: 70)
            )
            .cornerRadius(10)
    }
}

#Preview {
    ZStack {
        Color.yellow.ignoresSafeArea()
        
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
            .padding()
    }
    
}


extension LocationPreviewView {
    private var imageSection : some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection : some View {
        VStack(alignment: .leading, spacing : 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    
    private var learnMoreButton : some View {
        Button(action: {
            
        }, label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 125, height: 30)
        }).buttonStyle(.borderedProminent)
    }
    
    private var nextButton : some View {
        Button(action: {
            vm.nextButtonPressed()
        }, label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 30)
        }).buttonStyle(.bordered)
    }
}