//
//  LocationsListView.swift
//  MapAppSwiftUI
//
//  Created by Enes Talha Uçar  on 21.12.2023.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                listRowFunc(location: location)
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
            }.listStyle(PlainListStyle())
            
        }
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}


extension LocationsListView {
    private func listRowFunc(location : Location) -> some View{
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(15)
            }
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }.frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
}
