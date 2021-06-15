//
//  MyAirlines.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI

struct MyAirlinesView: View {
    
    @StateObject var airlines: AirlineModel
    @StateObject var data: DataModel
    
    var body: some View {
        VStack {
            List {
                Section(
                    header: Text("Airports"),
                    content: {
                        ForEach(airlines.airlines) { airline in
                            NavigationLink(
                                destination: AirlineDetailView(airlines: airlines, airline: airline, data: data),
                                label: {
                                    AirlineCellView(airline: airline)
                                        .contextMenu {
                                            Button {
                                                airlines.removeData(airline: airline)
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
            .navigationBarTitle("Marked Airlines", displayMode: .inline)
            .navigationBarColor(UIColor(named: "ElectronBlue"), UIColor(named: "SwanWhite"))
            .toolbar {
                // For adding the title
                ToolbarItem(placement: .principal) {
                    Text("Marked Airlines")
                        .modifier(Title())
                        .foregroundColor(Color("SwanWhite"))
                }
                
            }
    }
}

struct MyAirlinesView_Previews: PreviewProvider {
    static var previews: some View {
        MyAirlinesView(airlines: AirlineModel(), data: DataModel())
    }
}
