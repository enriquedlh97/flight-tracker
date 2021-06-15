//
//  FlightDetailView.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI

struct FlightDetailView: View {
    
    @StateObject var flights: FlightModel
    @State var flight: Flight
    @StateObject var data: DataModel
    
    
    var body: some View {
        ZStack {
            Text(flight.airline_name)
                .font(.SourceSansProSemiBold(size: 30))
                .foregroundColor(Color("AzulApp"))
                .padding(.bottom, 650)
            ZStack {
                //Info
                VStack {
                    
                    //Location airports
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(flight.departure_airport)
                                    .font(.SourceSansProBlack(size: 15))
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                Text("\(flight.departure_scheduled)")
                                    .font(.SourceSansProRegular(size: 12))
                            }
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text(flight.arrival_airport)
                                    .font(.SourceSansProBlack(size: 15))
                                    .multilineTextAlignment(.trailing)
                                Text("\(flight.arrival_scheduled)")
                                    .font(.SourceSansProRegular(size: 12))
                            }
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 25)
                        .padding(.top, 20)
                    }
                    Image("Airplane")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .padding(.top, 40)
                    
                    //Terminales y Gates
                    VStack {
                        HStack {
                            VStack {
                                Text("Departure \nTerminal").bold()
                                Text(flight.departure_terminal)
                            }
                            VStack {
                                Text("Departure \nGate").bold()
                                Text(flight.departure_gate)
                            }
                            
                            VStack {
                                Text("Arrival \nTerminal").bold()
                                Text(flight.arrival_terminal)
                            }
                            VStack {
                                Text("Arrival \nGate").bold()
                                Text(flight.arrival_gate)
                            }
                        }
                        .font(.SourceSansProRegular(size: 12))
                        .multilineTextAlignment(.center)
                        .frame(width: 320)
                        .padding(.bottom)
                    }
                    
                    //Numero de vuelo y status
                    VStack {
                        HStack{
                            VStack {
                                Text("Flight Number")
                                    .foregroundColor(Color("AzulApp"))
                                    .font(.SourceSansProSemiBold(size: 15))
                                Text(flight.flight_number)
                                    .font(.SourceSansProSemiBold(size: 15))
                            }
                            Spacer()
                            VStack {
                                Text("Status")
                                    .foregroundColor(Color("AzulApp"))
                                    .font(.SourceSansProSemiBold(size: 15))
                                    .font(.SourceSansProSemiBold(size: 15))
                                Text(flight.flight_status)
                            }
                            
                        }
                        .frame(width: 200)
                        .padding(.horizontal, 100)
                        
                    }
                    Spacer()
                    
                }
                //Fondo
                .frame(width: 320, height: 600, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(LinearGradient(gradient: Gradient(colors: [Color("AzulApp"), Color(.white), Color(.white),Color(.white)]), startPoint: .top, endPoint: .bottom))
                
                .cornerRadius(20)
            }
            .shadow(color: Color(.black).opacity(0.5), radius: 5, x: 5, y: 5)
            
        }
        //.background(Color("Clouds"))
        
        /*ZStack {
            VStack(alignment: .leading) {
                Text("Flight:").bold() + Text(" \(flight.airline_iata)-\(flight.flight_number)")
                Text("From:").bold() + Text(" \(flight.departure_airport)")
                Text("To:").bold() + Text(" \(flight.arrival_airport)")
                Text("Departure:").bold() + Text(" \(flight.departure_scheduled)")
                Text("Ariline Name:").bold() + Text(" \(flight.airline_name)")
                Text("Arrival Airport:").bold() + Text(" \(flight.arrival_airport)")
                Text("Arrival Gate:").bold() + Text(" \(flight.arrival_gate)")
                //Text("Arrival Terminal:").bold() + Text(" \(flight.arrival_terminal)")
                //Text("Arrival Timezone:").bold() + Text(" \(flight.arrival_timezone)")
                Text("Arrival Baggage Claim Gate:").bold() + Text(" \(flight.arrival_baggage)")
                Text("Arrival Airport:").bold() + Text(" \(flight.arrival_airport)")
                //Text("Departure Airport:").bold() + Text(" \(flight.departure_airport)")
                //Text("Departure Delay:").bold() + Text(" \(flight.departure_delay)")
                //Text("Arrival Airport:").bold() + Text(" \(flight.arrival_airport)")
                //Text("Departure Gate:").bold() + Text(" \(flight.departure_gate)")
                Text("Departure Terminal:").bold() + Text(" \(flight.departure_terminal)")
                //Text("Date:").bold() + Text(" \(flight.flight_date)")
                //Text("Status:").bold() + Text(" \(flight.flight_status)")
                
            
            }
        }*/
        
        /*
        @DocumentID var id: String? // Uses firebase to generate an id autoamtically
        var aircraft_iata: String // IATA code of the aircraft. Example: A321
        var aircraft_icao: String // ICAO code of the aircraft. Example: A321
        var aircraft_icao24: String // ICAO24 code of the aircraft. Example: A0F1BB
        var aircraft_registration: String // the registration number of the aircraft. Example: N160AN
        var airline_iata: String // IATA code of the airline. Example: AA
        var airline_icao: String // ICAO code of the airline. Example: AAL
        var airline_name: String // name of the airline. Example: American Airlines
        var arrival_airport: String // name of the arrival airport.
        var arrival_baggage: String // the baggage claim gate at the arrival airport.
        var arrival_delay: Float // the delay in arrival in minutes.
        var arrival_estimated: Date? // the actual arrival date and time in RFC3339 (ISO8601) format. Example: 2019-12-12T04:20:00+00:00
        var arrival_gate: String // the arrival gate.
        var arrival_iata: String // the IATA code of the arrival location/airport.
        var arrival_icao: String // the ICAO code of the arrival location/airport.
        var arrival_scheduled: Date // the scheduled arrival date and time in RFC3339 (ISO8601) format. Example: 2019-12-12T04:20:00+00:00
        var arrival_terminal: String // the arrival terminal.
        var arrival_timezone: String // the arrival timezone. Example: America/Los_Angeles
        var departure_airport: String // the name of the departure airport.
        var departure_delay: Float // the delay in departure in minutes.
        var departure_estimated: Date? // the estimated departure date and time in RFC3339 (ISO8601) format. Example: 2019-12-12T04:20:00+00:00
        var departure_gate: String // the departure gate.
        var departure_iata: String // the IATA code of the departure location/airport.
        var departure_icao: String // the ICAO code of the departure location/airport.
        var departure_scheduled: Date // the scheduled departure date and time in RFC3339 (ISO8601) format. Example: 2019-12-12T04:20:00+00:00
        var departure_terminal: String // the departure terminal.
        var departure_timezone: String // the departure timezone. Example: America/Los_Angeles
        var flight_date: String // the date of the flight. Format: YYYY-MM-DD
        var flight_iata: String // the IATA number of the flight. Example: AA1004
        var flight_icao: String // the ICAO number of the flight. Example: AAL1004
        var flight_number: String // the flight number. Example: 1004
        var flight_status: String // the flight status. Possible values: scheduled, active, landed, cancelled, incident, diverted
        var live_altitude: Float // the altitude (in meters) of the aircraft at the given time.
        var live_direction: Float // the direction (in degrees) of the aircraft at the given time.
        var live_is_ground: Bool // true or false depending on whether or not the aircraft is on the ground at the given time.
        var live_latitude: Float // the latitude coordinate associated with the aircraft location.
        var live_longitude: Float // the longitude coordinate associated with the aircraft location.
        var live_speed_horizontal: Float // the horizontal speed (in kilometers per hour) of the aircraft at the given time.
        var live_speed_vertical: Float // the vertical speed (in kilometers per hour) of the aircraft at the given time.
        var live_updated: Date // the exact date and time the live data was collected in RFC3339 (ISO8601) format.
        */
        
        .navigationBarTitle("Flight \(flight.airline_iata)-\(flight.flight_number)", displayMode: .inline)
        .navigationBarColor(UIColor(named: "ElectronBlue"), UIColor(named: "SwanWhite"))
        .toolbar {
            // For adding the title
            ToolbarItem(placement: .principal) {
                Text("Flight \(flight.airline_iata)-\(flight.flight_number)")
                    .modifier(Title())
                    .foregroundColor(Color("SwanWhite"))
                    .padding(.bottom, 20)
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    }


struct FlightDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlightDetailView(flights: FlightModel(), flight: Flight.dummy, data: DataModel())
    }
}
