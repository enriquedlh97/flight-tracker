//
//  AirlineDetailView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/11/21.
// ARREGLAR IMAGEN

import SwiftUI
import Kingfisher

struct AirlineDetailView: View {
    
    @StateObject var airlines: AirlineModel
    @State var airline: Airline
    @StateObject var data: DataModel
    
    var body: some View {
        ZStack {
            Text((airline.airline_name))
                .font(.SourceSansProSemiBold(size: 30))
                .padding(.bottom, 650)
                .foregroundColor(Color("AzulApp"))
            ZStack{
                VStack {
                    //Image
                    VStack{
                        Image("airline")
                            .resizable()
                            .frame(width: 240, height: 228, alignment: .bottom)
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                    }
                    
                    VStack {
                        KFImage(URL(string: airline.flag)!)
                            .resizable()
                            .frame(width: 90, height: 58, alignment: .bottom)
                            .cornerRadius(8)
                        
                    }
                    //                VStack {
                    //                    Text((airline.airline_name))
                    //                        .font(.SourceSansProBlack(size: 40))
                    //                        .padding(.horizontal)
                    //                }
                    
                    VStack(alignment: .leading) {
                        //Text("Airline: \(airline.airline_name)")
                        Text("Origin Country: \(airline.country_name)")
                        Text("Callsign: \(airline.callsign)")
                        Text("Status: \(airline.status)")
                        Text("Date Founded: \(airline.date_founded)")
                        Text("Fleet size: \(airline.fleet_size)")
                        Text("Fleet Average Age: \(airline.fleet_average_age)")
                        Text("IATA code: \(airline.iata_code)")
                        Text("ICAO code: \(airline.icao_code)")
                        Text("HUB code: \(airline.hub_code)")
                        
                        
                    }
                    .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                    .font(.SourceSansProSemiBold(size: 17))
                }
                .frame(width: 320, height: 600, alignment: .center)
                .background(LinearGradient(gradient: Gradient(colors: [Color("AzulApp"), Color(.white), Color(.white),Color(.white)]), startPoint: .top, endPoint: .bottom))
                
                .cornerRadius(20)
                .shadow(color: Color(.black).opacity(0.5), radius: 5, x: 5, y: 5)
            }
            
            
            
            
            .navigationBarTitle("Airline: \(airline.airline_name)", displayMode: .inline)
            .navigationBarColor(UIColor(named: "ElectronBlue"), UIColor(named: "SwanWhite"))
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                // For adding the title
                ToolbarItem(placement: .principal) {
                    Text("Airline: \(airline.airline_name)")
                        .modifier(Title())
                        .foregroundColor(Color("SwanWhite"))
                        .padding(.bottom, 20)
                        .navigationBarTitleDisplayMode(.inline)

                }
            }
        }
                }
                
}

struct AirlineDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AirlineDetailView(airlines: AirlineModel(), airline: Airline.dummy, data: DataModel())
    }
}
