//
//  AirportDetailView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/11/21.
//

import SwiftUI
import Kingfisher

struct AirportDetailView: View {
    
    @StateObject var airports: AirportModel
    @State var airport: Airport
    @StateObject var data: DataModel
    
    var body: some View {
        ZStack {
            Text("Airport: \(airport.airport_name)")
                .foregroundColor(Color("AzulApp"))
                .font(.SourceSansProSemiBold(size: 35))
                .padding(.bottom, 650)
            ZStack {
                VStack {
                VStack {
                    //Image
                    Image("airport")
                        .resizable()
                        .frame(width: 270, height: 148, alignment: .top)
                                   
                }
                .padding(.bottom, 90)
                    VStack {
                        KFImage(URL(string: airport.flag)!)
                                        .resizable()
                            .frame(width: 90, height: 58, alignment: .bottom)
                                    .cornerRadius(8)
                            .padding(.bottom, 10)
                        
                    }
                VStack (alignment: .leading) {
                    
                    Text("Country: \(airport.country_name)")
                    Text("City IATA: \(airport.city_iata_code)")
                    Text("Timezone: \(airport.timezone)")
                    Text("GMT: \(airport.gmt)")
                    Text("GeoName ID: \(airport.geoname_id)")
                    Text("Phone: \(airport.phone_number ?? "Not available")")
                    
                    //city_iata_code
                    
                }
                .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                .font(.SourceSansProSemiBold(size: 17))
            }
            .frame(width: 320, height: 600, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(LinearGradient(gradient: Gradient(colors: [Color("AzulApp"), Color(.white), Color(.white),Color(.white)]), startPoint: .top, endPoint: .bottom))
            
            .cornerRadius(20)
            .shadow(color: Color(.black).opacity(0.5), radius: 5, x: 5, y: 5)
        }
        .navigationBarTitle("Airport: \(airport.airport_name)", displayMode: .inline)
        .navigationBarColor(UIColor(named: "ElectronBlue"), UIColor(named: "SwanWhite"))
        .toolbar {
            // For adding the title
            ToolbarItem(placement: .principal) {
                Text("Airport: \(airport.airport_name)")
                    .modifier(Title())
                    .foregroundColor(Color("SwanWhite"))
                    .padding(.bottom, 20)
                    .navigationBarTitleDisplayMode(.inline)

            }
        }
    }
                
            }
           
}

struct AirportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AirportDetailView(airports: AirportModel(), airport: Airport.dummy, data: DataModel())
    }
}
