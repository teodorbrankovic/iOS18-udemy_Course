//
//  Place.swift
//  VacationInVegas
//
//  Created by Teodor Brankovic on 31.10.24.
//

import SwiftData
import SwiftUI
import MapKit

@Model
class Place {
//    #Unique<Place>([\.name], \.latitude, \.longitude]) doesn't work
    
    // stored properties
    @Attribute(.unique) var name: String // every name is unique
    var latitude: Double
    var longitude: Double
    var interested: Bool
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude) // converts our double to an actual location
    }
    
    var image: Image {
        Image(name.lowercased().replacingOccurrences(of: " ", with: "")) // lowercase and without spaces "bellagio" etc. from var name
    }
    
    init(name: String, latitude: Double, longitude: Double, interested: Bool) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.interested = interested
    }
    
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Place.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        for place in previewPlaces {
            container.mainContext.insert(place)
        }
        
        return container
    }
    
    static var previewPlaces: [Place] {
        [
            Place(name: "Bellagio", latitude: 36.1129, longitude: -115.1765, interested: true),
            Place(name: "Paris", latitude: 36.1125, longitude: -115.1707, interested: true),
            Place(name: "Treasure Island", latitude: 36.1147, longitude: -115.1721, interested: true),
            Place(name: "Stratosphere", latitude: 36.1175, longitude: -115.1566, interested: false),
            Place(name: "Luxor", latitude: 36.0955, longitude: -115.1761, interested: true),
            Place(name: "Excalibur", latitude: 36.0988, longitude: -115.1754, interested: false)
        ]
    }
}
