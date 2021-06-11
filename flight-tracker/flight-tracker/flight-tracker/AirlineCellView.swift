//
//  AirlineCellView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/11/21.
//

import SwiftUI

struct AirlineCellView: View {
    
    var airline: Airline
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Name: \(airline.airline_name)")
                    Text("Country: \(airline.country_name)")
                }
                VStack {
                    
                    Text("Callsign: \(airline.callsign)")
                    
                }
            }
        }
    }
}

struct AirlineCellView_Previews: PreviewProvider {
    static var previews: some View {
        AirlineCellView(airline: Airline.dummy)
    }
}
