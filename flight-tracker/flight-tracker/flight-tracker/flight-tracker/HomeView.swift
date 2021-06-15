//
//  HomeView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        //para saber cuando ya va a la pantalla principal
        if currentPage > totalPages {
            MainView()
        }else {
            ExplainingScreen()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//Pantalla principal
struct MainView: View {
    @StateObject var data = DataModel()
    @StateObject var flights = FlightModel()
    @StateObject var airports = AirportModel()
    @StateObject var airlines = AirlineModel()
    
    var body: some View {
        VStack {
        TabView {
    
            MyTripView(flights: flights, data: data, airports: airports, airlines: airlines)
                .tabItem {
                    Image(systemName: "point.fill.topleft.down.curvedto.point.fill.bottomright.up")
                    Text("MyTrip")
                }
            
            FlightListView(flights: flights, data: data)
                .tabItem {
                    Image(systemName: "airplane.circle.fill")
                    Text("Flights")
                }
            
            AirlinesListView(airlines: airlines, data: data)
                .tabItem {
                    Image(systemName: "network")
                    Text("Airlines")
                }
            
            AirportsListView(airports: airports, data: data)
                .tabItem {
                    Image(systemName: "building.2.crop.circle.fill")
                    Text("Airports")
                }
        }
            
        }
        .accentColor(Color("Alizarin"))
        .onAppear {
            UITabBar.appearance().barTintColor = UIColor(Color("SourLemon"))
        }
    }
}

//Pantalla de 3 pasos
struct ExplainingScreen: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        
        ZStack{
            //Para cambiar de pasos o paginas
            if currentPage == 1 {
                StepsView(image: "Pantalla 1", mainText: "1. My Trip", description: "Track and plan your next flight and keep a record of your visited airports and airlines.", textColor: .white, backgroundColor: Color("C64Purple"))
                    .transition(.scale)
            }
            if currentPage == 2 {
                StepsView(image: "Pantalla 2", mainText: "2. Flights", description: "Look into all LIVE flights and its details. \nSave the ones you like.", textColor: .white, backgroundColor: Color("SummerSky"))
                    .transition(.scale)
            }
            if currentPage == 3 {
                StepsView(image: "Pantalla 3", mainText: "3. Airlines", description: "Get to know and explore the airlines available. \nSave the ones you like.", textColor: .white, backgroundColor: Color("Nephritis"))
                    .transition(.scale)
            }

        }
        .overlay(
            //boton para avanzar
            Button(action: {
                withAnimation(.easeInOut) {
                    
                    if currentPage < totalPages {
                        currentPage += 1
                    } else {
                        currentPage = 4
                    }
                }
            }, label: {
                Image(systemName: "chevron.forward.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    

            })
            .padding(.bottom, 20)
            ,alignment: .bottom
                
        )
        
    }
}

struct StepsView: View {
    
    var image: String
    var mainText: String
    var description: String
    var textColor: Color
    var backgroundColor: Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack {
            HStack{
                
                if currentPage == 1 {
                    Text("Welcome to Flight Tracker")
                        .font(.SourceSansProBold(size: 22))
                        .foregroundColor(textColor)
                } else {
                    //boton para regresar al paso anterior
                    Button(action: {
                        withAnimation(.easeInOut){
                            currentPage -= 1
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20))
                            .foregroundColor(textColor)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                //boton para saltar los pasos
                Button(action: {
                    withAnimation(.easeInOut) {
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .font(.SourceSansProRegular(size: 20))
                        .foregroundColor(textColor)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                })
            }
            .padding()
            
            Spacer()
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(mainText)
                .font(.SourceSansProBlack(size: 32))
                .foregroundColor(textColor)
                .padding(.top)
            Text(description)
                .font(.SourceSansProRegular(size: 18))
                .foregroundColor(textColor)
                .padding()
                .multilineTextAlignment(.center)
            Spacer()
            Spacer()
        }
        .background(backgroundColor.cornerRadius(10).ignoresSafeArea())
    }
}

//paginas totales de intro
var totalPages = 3
