//
//  FlightListView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI

struct FlightListView: View {    
    
    @StateObject var flights: FlightModel
    @StateObject var data: DataModel
    @State var text = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                SearchBarView(text: $text)
                    .padding(.top, 8)
                List {
                    Section(
                    header: Text("Live Flights"),
                        content: {
                            ForEach(data.flightsList.filter {$0.airline_name.contains(text) || $0.aircraft_iata.contains(text) || $0.aircraft_icao.contains(text) || $0.flight_number.contains(text) || $0.departure_airport.contains(text) || $0.airline_iata.contains(text) || $0.airline_icao.contains(text) || "\($0.airline_iata)-\($0.flight_number)".contains(text) || text.isEmpty}, id: \.flight_number) { flight in
                                NavigationLink(destination: FlightDetailView(flights: flights, flight: flight, data: data), label: {FlightCellView(flight: flight)
                                    .contextMenu {
                                        Button {
                                            flights.addData(flight: flight)
                                        } label: {
                                            HStack {
                                                Text("Track")
                                                Image(systemName: "plus.circle.fill")
                                            }
                                        }
                                    }
                                })
                            }
                        })
                }
                .listStyle(PlainListStyle())

//                List(data.flightsList, id: \.flight_number) { flight in
//                    NavigationLink(destination: FlightDetailView(flight: flight, data: data), label: {FlightCellView(flight: flight)})
//                }
            }
        //    .padding(.bottom, 20)
            .navigationBarTitle("Flights", displayMode: .inline)
            .navigationBarColor(UIColor(named: "ElectronBlue"), UIColor(named: "SwanWhite"))
            
            
            .toolbar {
                // For adding the title
                ToolbarItem(placement: .principal) {
                    Text("Flight")
                        .modifier(Title())
                        .foregroundColor(Color("SwanWhite"))
                }
            }
        }
    }
    
}

struct FlightListView_Previews: PreviewProvider {
    static var previews: some View {
        FlightListView(flights: FlightModel(), data: DataModel())
    }
}
