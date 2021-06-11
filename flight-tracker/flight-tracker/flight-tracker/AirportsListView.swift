//
//  AirportsListView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/11/21.
//

import SwiftUI

struct AirportsListView: View {
    
    @StateObject var airports: AirportModel
    @StateObject var data: DataModel
    @State var text = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(text: $text)
                    .padding(.top, 8)
                List {
                    Section(
                    header: Text("Airports"),
                        content: {
                            ForEach(data.airportsList.filter {$0.country_name.contains(text) || $0.iata_code.contains(text) || $0.airport_name.contains(text) || $0.icao_code.contains(text) || $0.geoname_id.contains(text) || text.isEmpty}, id: \.icao_code) { airport in
                                NavigationLink(destination: AirportDetailView(), label: {AirportCellView()
                                    .contextMenu {
                                        Button {
                                            airports.addData(airport: airport)
                                        } label: {
                                            HStack {
                                                Text("Save as visited")
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
}

struct AirportsListView_Previews: PreviewProvider {
    static var previews: some View {
        AirportsListView(airports: AirportModel(), data: DataModel())
    }
}
