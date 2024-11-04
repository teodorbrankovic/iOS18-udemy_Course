//
//  VacationInVegasApp.swift
//  VacationInVegas
//
//  Created by Teodor Brankovic on 30.10.24.
//

import SwiftUI

@main
struct VacationInVegasApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Place.self)
    }
}
