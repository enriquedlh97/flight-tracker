//
//  HomeView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var data = DataModel()
    
    var body: some View {
        VStack {
            
            NavigationView {
                
                TabView {
                    
                    FlightListView(data: data)
    
                }
                
            }
            
        }
        .accentColor(Color("Alizarin"))
        .onAppear {
            UITabBar.appearance().barTintColor = UIColor(Color("SourLemon"))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
