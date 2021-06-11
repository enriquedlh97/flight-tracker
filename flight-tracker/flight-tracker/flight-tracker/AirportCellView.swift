//
//  AirportCellView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/11/21.
//

import SwiftUI

struct AirportCellView: View {
    
    var airport: Airport
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Name: \(airport.airport_name)")
                    Text("Country: \(airport.country_name)")
                }
                VStack {
                    
                    Text("Timezone: \(airport.timezone)")
                    
                }
            }
        }
    }
}

struct AirportCellView_Previews: PreviewProvider {
    static var previews: some View {
        AirportCellView(airport: Airport.dummy)
    }
}
