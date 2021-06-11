//
//  AirportsListView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/11/21.
//

import SwiftUI

struct AirportsListView: View {
    var body: some View {
        VStack {
            Text("Airports")
        }
        .navigationBarTitle("Airports", displayMode: .inline)
        .navigationBarColor(UIColor(named: "ElectronBlue"), UIColor(named: "SwanWhite"))
        .toolbar {
            // For adding the title
            ToolbarItem(placement: .principal) {
                Text("Airports")
                    .modifier(Title())
                    .foregroundColor(Color("SwanWhite"))
            }
            
        }
    }
}

struct AirportsListView_Previews: PreviewProvider {
    static var previews: some View {
        AirportsListView()
    }
}