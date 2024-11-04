//
//  ContentView.swift
//  VacationInVegas
//
//  Created by Teodor Brankovic on 30.10.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            
            Tab("Places", systemImage: "photo") {
                PlaceList()
            }
            
            Tab("Trip History", systemImage: "chart.line.uptrend.xyaxis") {
                TripsChart()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
        .modelContainer(Place.preview)
}
