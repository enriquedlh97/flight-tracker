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
                VStack (alignment: .leading){
                    Text("Flight:").bold() + Text(" \(flight.airline_iata)-\(flight.flight_number)")
                        .font(.SourceSansProRegular(size: 15))
                    Text("Departure:").bold() + Text(" \(flight.departure_scheduled)")
                        .font(.SourceSansProRegular(size: 15))
                }
                Spacer()
                    
                .font(.SourceSansProRegular(size: 15))
                VStack {
        
                    Text("From:").bold() + Text(" \(flight.departure_airport)")
                        .font(.SourceSansProRegular(size: 15))
                    Text("To:").bold() + Text(" \(flight.arrival_airport)")
                        .font(.SourceSansProRegular(size: 15))
                    
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct FlightCellView_Previews: PreviewProvider {
    static var previews: some View {
        FlightCellView(flight: Flight.dummy)
    }
}
