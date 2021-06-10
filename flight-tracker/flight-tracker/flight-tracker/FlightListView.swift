//
//  FlightListView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI

struct FlightListView: View {    
    
    @ObservedObject var flights = DataModel()
    
    var body: some View {
        NavigationView {
            List() {
                
            }
            .listStyle(DefaultListStyle())
            .navigationBarTitle("MyFlights", displayMode: .inline)
            .navigationBarColor(UIColor(named: "ElectronBlue"), UIColor(named: "SwanWhite"))
            .toolbar {
                // For adding the title
                ToolbarItem(placement: .principal) {
                    Text("MyFlights")
                        .modifier(Title())
                        .foregroundColor(Color("SwanWhite"))
                }
            }
        }
    }
    
}

struct FlightListView_Previews: PreviewProvider {
    static var previews: some View {
        FlightListView()
    }
}