//
//  AirlineDetailView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/11/21.
//

import SwiftUI

struct AirlineDetailView: View {
    
    @StateObject var airlines: AirlineModel
    @State var airline: Airline
    @StateObject var data: DataModel
    
    var body: some View {
        ZStack {
            VStack {
                Text("Airline: \(airline.airline_name)")
                Text("Country: \(airline.country_name)")
                Text("Callsign: \(airline.callsign)")
            }
        }
        .navigationBarTitle("Airline: \(airline.airline_name)", displayMode: .inline)
        .navigationBarColor(UIColor(named: "ElectronBlue"), UIColor(named: "SwanWhite"))
        .toolbar {
            // For adding the title
            ToolbarItem(placement: .principal) {
                Text("Airline: \(airline.airline_name)")
                    .modifier(Title())
                    .foregroundColor(Color("SwanWhite"))
            }
        }
    }
}

struct AirlineDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AirlineDetailView(airlines: AirlineModel(), airline: Airline.dummy, data: DataModel())
    }
}
