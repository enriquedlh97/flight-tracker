//
//  FlightCellView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI

struct FlightCellView: View {
    
    var flight: Flight
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                Text("Flight: \(flight.airline_iata)-\(flight.flight_number)")
                    Text("Departure: \(flight.departure_scheduled)")
                }
                VStack {
        
                    Text("From: \(flight.departure_airport)")
                    Text("To: \(flight.arrival_airport)")
                    
                }
            }
        }
    }
}

struct FlightCellView_Previews: PreviewProvider {
    static var previews: some View {
        FlightCellView(flight: Flight.dummy)
    }
}
