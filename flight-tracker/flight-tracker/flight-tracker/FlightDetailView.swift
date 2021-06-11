//
//  FlightDetailView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI

struct FlightDetailView: View {
    
    @StateObject var flights: FlightModel
    @State var flight: Flight
    @StateObject var data: DataModel
    
    
    var body: some View {
        ZStack {
            VStack {
                Toggle("Save flight", isOn: $flight.saved)
                    .onChange(of: flight.saved, perform: { value in
                        if (value == true) {
                            flights.addData(flight: flight)
                        } else {
                            flights.removeData(flight: flight)
                        }
                    })
                Text("Flight: \(flight.airline_iata)-\(flight.flight_number)")
                Text("From: \(flight.departure_airport)")
                Text("To: \(flight.arrival_airport)")
                Text("Departure: \(flight.departure_scheduled)")
            }
        }
        .navigationBarTitle("Flight \(flight.airline_iata)-\(flight.flight_number)", displayMode: .inline)
        .navigationBarColor(UIColor(named: "ElectronBlue"), UIColor(named: "SwanWhite"))
        .toolbar {
            // For adding the title
            ToolbarItem(placement: .principal) {
                Text("Flight \(flight.airline_iata)-\(flight.flight_number)")
                    .modifier(Title())
                    .foregroundColor(Color("SwanWhite"))
            }
        }
    }
    }


struct FlightDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlightDetailView(flights: FlightModel(), flight: Flight.dummy, data: DataModel())
    }
}
