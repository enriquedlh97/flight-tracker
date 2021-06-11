//
//  ContentView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/8/21.
//

import SwiftUI

struct MyTripView: View {
    
    @StateObject var flights: FlightModel
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
                    Section(
                        header: Text("My Next Flights"),
                        content: {
                            ForEach(flights.flights) { flight in
                                NavigationLink(
                                    destination: FlightDetailView(flights: flights, flight: flight, data: data),
                                    label: {
                                        FlightCellView(flight: flight)
                                            .contextMenu {
                                                Button {
                                                    flights.removeData(flight: flight)
                                                } label: {
                                                    HStack {
                                                        Text("Delete")
                                                        Image(systemName: "xmark.circle.fill")
                                                    }
                                                }
                                            }
                                    })
                            }
                        })
                }
                .listStyle(PlainListStyle())
                //                NavigationView {
                //                    ZStack {
                //                        List {
                //                            ForEach(flights.flights) { flight in
                //                                NavigationLink(
                //                                    destination: FlightDetailView(flight: flight, data: data),
                //                                    label: {
                //                                        FlightCellView(flight: flight)
                //                                            .contextMenu {
                //                                                Button {
                //                                                    flights.removeData(flight: flight)
                //                                                } label: {
                //                                                    HStack {
                //                                                        Text("Delete")
                //                                                        Image(systemName: "xmark.circle.fill")
                //                                                    }
                //                                                }
                //                                            }
                //                                    })
                //                            }
                //                        }
                //                    }
                //                }
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
        MyTripView(flights: FlightModel(), data: DataModel())
    }
}
