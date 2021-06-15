//
//  MyAirports.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI

struct MyAirportsView: View {
    
    @StateObject var airports: AirportModel
    @StateObject var data: DataModel
    
    var body: some View {
        VStack {
            List {
                Section(
                    header: Text("Airports"),
                    content: {
                        ForEach(airports.airports) { airport in
                            NavigationLink(
                                destination: AirportDetailView(airports: airports, airport: airport, data: data),
                                label: {
                                    AirportCellView(airport: airport)
                                        .contextMenu {
                                            Button {
                                                airports.removeData(airport: airport)
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
        MyAirportsView(airports: AirportModel(), data: DataModel())
    }
}
