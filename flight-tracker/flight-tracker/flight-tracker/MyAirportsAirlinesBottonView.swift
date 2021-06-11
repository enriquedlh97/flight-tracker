//
//  MyAirportsAirlinesBottonView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI

struct MyAirportsAirlinesBottonView: View {
    
    var label: String
    
    var body: some View {
        VStack {
                Text(label)
                    .padding(.horizontal, 15)
                    .padding()
        }
        .background(Color("CityLights"))
        .cornerRadius(10)
    }
}

struct MyAirportsAirlinesBottonView_Previews: PreviewProvider {
    static var previews: some View {
        MyAirportsAirlinesBottonView(label: "Airports")
    }
}
