//
//  AirportDetailView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/11/21.
//

import SwiftUI

struct AirportDetailView: View {
    
    @StateObject var airports: AirportModel
    @State var airport: Airport
    @StateObject var data: DataModel
    
    var body: some View {
        ZStack {
            VStack {
                Text("Airport: \(airport.airport_name)")
                Text("Country: \(airport.country_name)")
                Text("Timezone: \(airport.timezone)")
            }
        }
        .navigationBarTitle("Airport: \(airport.airport_name)", displayMode: .inline)
        .navigationBarColor(UIColor(named: "ElectronBlue"), UIColor(named: "SwanWhite"))
        .toolbar {
            // For adding the title
            ToolbarItem(placement: .principal) {
                Text("Airport: \(airport.airport_name)")
                    .modifier(Title())
                    .foregroundColor(Color("SwanWhite"))
            }
        }
    }
}

struct AirportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AirportDetailView(airports: AirportModel(), airport: Airport.dummy, data: DataModel())
    }
}
