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
            Spacer()
            ZStack {
                Text(label)
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color("SourLemon"), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                
            }
            Spacer()
        }
    }
}

struct MyAirportsAirlinesBottonView_Previews: PreviewProvider {
    static var previews: some View {
        MyAirportsAirlinesBottonView(label: "Airports")
    }
}
