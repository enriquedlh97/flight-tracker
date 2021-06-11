//
//  HomeView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var data = DataModel()
    @StateObject var flights = FlightModel()
    
    var body: some View {
        TabView {
            FlightListView(flights: flights, data: data)
                .tabItem {
                    Image(systemName: "airplane.circle.fill")
                    Text("Flights")
                }
            MyTripView(flights: flights, data: data)
                .tabItem {
                    Image(systemName: "point.fill.topleft.down.curvedto.point.fill.bottomright.up")
                    Text("MyTrip")
                }
        }
        .accentColor(Color("Alizarin"))
        .onAppear {
            UITabBar.appearance().barTintColor = UIColor(Color("SourLemon"))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
