//
//  MyAirports.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI

struct MyAirportsView: View {
    var body: some View {
        VStack {
            Text("Visited Airports")
        }
        .navigationBarTitle("Visited Airports", displayMode: .inline)
        .navigationBarColor(UIColor(named: "ElectronBlue"), UIColor(named: "SwanWhite"))
        .toolbar {
            // For adding the title
            ToolbarItem(placement: .principal) {
                Text("Visited Airports")
                    .modifier(Title())
                    .foregroundColor(Color("SwanWhite"))
            }
            
        }
    }
}

struct MyAirportsView_Previews: PreviewProvider {
    static var previews: some View {
        MyAirportsView()
    }
}
