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
                Text("Airlines")
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
        AirlinesListView()
    }
}
