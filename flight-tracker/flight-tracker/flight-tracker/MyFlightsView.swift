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
        List(flights.flights) { flight in
            Text("\(flight.airline_iata)\(flight.flight_number)")
        }
    }
}

struct MyFlightsView_Previews: PreviewProvider {
    static var previews: some View {
        MyFlightsView()
    }
}
