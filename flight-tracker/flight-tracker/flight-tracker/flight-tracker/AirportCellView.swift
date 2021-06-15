//
//  AirportCellView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/11/21.
//

import SwiftUI

struct AirportCellView: View {
    
    var airport: Airport
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Name:").bold() + Text(" \(airport.airport_name)")
                    Text("Country:").bold() + Text(" \(airport.country_name)")
                }
                .font(.SourceSansProRegular(size: 15))
                Spacer()
                
                VStack {
                    
                    Text("Timezone:").bold() + Text("\n \(airport.timezone)")
                    
                }
                .font(.SourceSansProRegular(size: 15))
                .multilineTextAlignment(.trailing)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct AirportCellView_Previews: PreviewProvider {
    static var previews: some View {
        AirportCellView(airport: Airport.dummy)
    }
}
