//
//  HomeView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var data = DataModel()
    
    var body: some View {
        TabView {
            FlightListView(data: data)
                .tabItem {
                    Label("Flights", systemImage: "airplane.circle.fill")
                }
            MyFlightsView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
