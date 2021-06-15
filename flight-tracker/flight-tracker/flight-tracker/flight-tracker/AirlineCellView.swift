//
//  AirlineCellView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/11/21.
//

import SwiftUI

struct AirlineCellView: View {
    
    var airline: Airline
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading){
                    Text("Name:").bold() + Text(" \(airline.airline_name)")
                    Text("Country:").bold() + Text(" \(airline.country_name)")
                    Text("Fleet size:").bold() + Text(" \(airline.fleet_size)")
                    
                }
                Spacer()
                .font(.SourceSansProRegular(size: 20))
                VStack{
                    
                    Text("Callsign:").bold() + Text(" \n\(airline.callsign)")
                        
                    
                }
                .multilineTextAlignment(.trailing)
            }
            .padding(.horizontal, 20)
        }
        .padding(.vertical)
    }
}

struct AirlineCellView_Previews: PreviewProvider {
    static var previews: some View {
        AirlineCellView(airline: Airline.dummy)
    }
}
