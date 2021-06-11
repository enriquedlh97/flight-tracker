//
//  ContentView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/8/21.
//

import SwiftUI

struct MyTripView: View {
    
    @ObservedObject var flights = FlightModel()
    @StateObject var data: DataModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    
                    
                    NavigationLink(destination: MyAirportsView(), label: {MyAirportsAirlinesBottonView(label: "Visited Airports")})
                    
                    NavigationLink(destination: MyAirlinesView(), label: {MyAirportsAirlinesBottonView(label: "Marked Airlines")})
            
                }
                .padding(.top, 10)
                Spacer()
                List {
                    Section(header: Text("My Next Flights"), content: {})
                }
                .listStyle(PlainListStyle())
                Spacer()
                NavigationView {
                    ZStack {
                        List {
                            ForEach(flights.flights) { flight in
                                NavigationLink(
                                    destination: FlightDetailView(flight: flight, data: data),
                                    label: {
                                    FlightCellView(flight: flight)
                                    })
                                
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("MyTrip", displayMode: .inline)
            .navigationBarColor(UIColor(named: "ElectronBlue"), UIColor(named: "SwanWhite"))
            .toolbar {
                // For adding the title
                ToolbarItem(placement: .principal) {
                    Text("MyTrip")
                        .modifier(Title())
                        .foregroundColor(Color("SwanWhite"))
                }
            }
        }
    }
}

struct MyFlightsView_Previews: PreviewProvider {
    static var previews: some View {
        MyTripView()
    }
}
