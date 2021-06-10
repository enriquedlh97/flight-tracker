//
//  FlightDetailView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI

struct FlightDetailView: View {
    
    var flight: Flight
    @StateObject var data: DataModel
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(flight.airline_iata)-\(flight.flight_number)")
                Text("From: \(flight.departure_airport)")
                Text("To: \(flight.arrival_airport)")
            }
        }
    }
}

struct FlightDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlightDetailView(flight: Flight.dummy, data: DataModel())
    }
}
