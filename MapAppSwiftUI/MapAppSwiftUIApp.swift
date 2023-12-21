//
//  MapAppSwiftUIApp.swift
//  MapAppSwiftUI
//
//  Created by Enes Talha Uçar  on 21.12.2023.
//

import SwiftUI

@main
struct MapAppSwiftUIApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
