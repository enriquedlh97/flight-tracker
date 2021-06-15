//
//  flight_trackerApp.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/8/21.
//

import SwiftUI
import Firebase

@main
struct flight_trackerApp: App {
    
    init() {
        // Allows connection to firebase
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

