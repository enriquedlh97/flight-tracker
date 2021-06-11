//
//  MyAirlines.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI

struct MyAirlinesView: View {
    var body: some View {
            VStack {
                Text("Marked Airlines")
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
        MyAirlinesView()
    }
}
