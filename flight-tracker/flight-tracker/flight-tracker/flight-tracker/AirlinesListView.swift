//
//  AirlinesListView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/11/21.
//

import SwiftUI

struct AirlinesListView: View {
    
    @StateObject var airlines: AirlineModel
    @StateObject var data: DataModel
    @State var text = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(text: $text)
                    .padding(.top, 8)
                List {
                    Section(
                    header: Text("Airlines"),
                        content: {
                            ForEach(data.airlinesList.filter {$0.airline_name.contains(text) || $0.callsign.contains(text) || $0.country_name.contains(text) || text.isEmpty}, id: \.icao_code) { airline in
                                NavigationLink(destination: AirlineDetailView(airlines: airlines, airline: airline, data: data), label: {AirlineCellView(airline: airline)
                                    .contextMenu {
                                        Button {
                                            airlines.addData(airline: airline)
                                        } label: {
                                            HStack {
                                                Text("Save to favorites")
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
            .navigationBarTitle("Airlines", displayMode: .inline)
            .navigationBarColor(UIColor(named: "ElectronBlue"), UIColor(named: "SwanWhite"))
            .toolbar {
                // For adding the title
                ToolbarItem(placement: .principal) {
                    Text("Airlines")
                        .modifier(Title())
                        .foregroundColor(Color("SwanWhite"))
                }
                
            }
        }
    }
}

struct AirlinesListView_Previews: PreviewProvider {
    static var previews: some View {
        AirlinesListView(airlines: AirlineModel(), data: DataModel())
    }
}
