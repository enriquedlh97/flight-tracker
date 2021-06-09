//
//  ContentView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/8/21.
//

import SwiftUI

struct MyFlightsView: View {
    
    @ObservedObject var flights = FlightModel()
    
    var body: some View {
        NavigationView {
            List(flights.flights) { flight in
                Text("\(flight.airline_iata)-\(flight.flight_number)")
            }
            .listStyle(DefaultListStyle())
            .navigationBarTitle("MyFlights", displayMode: .inline)
            .navigationBarColor(UIColor(named: "ElectronBlue"), UIColor(named: "SwanWhite"))
            .toolbar {
                // For adding the title
                ToolbarItem(placement: .principal) {
                    Text("MyFlights")
                        .modifier(Title())
                        .foregroundColor("SwanWhite")
                }
            }
        }
    }
}

struct MyFlightsView_Previews: PreviewProvider {
    static var previews: some View {
        MyFlightsView()
    }
}
