//
//  DataModel.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON

class DataModel: ObservableObject {
    
    @Published var flights = [Flight]()
    
    init() {
        getFlights()
    }
    
    func getFlights() {
        
        let URL = "http://api.aviationstack.com/v1/flights?access_key=\(apikey)"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default).responseData { data in
            
            let json = try! JSON(data: data.data!)
            //print(json["data"])
            var flight: Flight
            for f in json["data"] {
                //print(f.1["flight_date"])
                //print(f.1["arrival"]["airport"])
                
                flight = Flight(aircraft_iata: f.1["aircraft"]["iata"].stringValue,
                                aircraft_icao: f.1["aircraft"]["icao"].stringValue,
                                aircraft_icao24: f.1["aircraft"]["icao24"].stringValue,
                                aircraft_registration: f.1["aircraft"]["registration"].stringValue,
                                airline_iata: f.1["airline"]["iata"].stringValue,
                                airline_icao: f.1["airline"]["icao"].stringValue,
                                airline_name: f.1["airline"]["name"].stringValue,
                                arrival_airport: f.1["arrival"]["airport"].stringValue,
                                arrival_baggage: f.1["arrival"]["baggage"].stringValue,
                                arrival_delay: f.1["arrival"]["delay"].floatValue,
                                arrival_estimated: <#T##Date#>,
                                arrival_gate: <#T##String#>,
                                arrival_iata: <#T##String#>,
                                arrival_icao: <#T##String#>,
                                arrival_scheduled: <#T##Date#>,
                                arrival_terminal: <#T##String#>,
                                arrival_timezone: <#T##String#>,
                                departure_airport: <#T##String#>,
                                departure_delay: <#T##Float#>,
                                departure_estimated: <#T##Date#>,
                                departure_gate: <#T##String#>,
                                departure_iata: <#T##String#>,
                                departure_icao: <#T##String#>,
                                departure_scheduled: <#T##Date#>,
                                departure_terminal: <#T##String#>,
                                departure_timezone: <#T##String#>,
                                flight_date: <#T##String#>,
                                flight_iata: <#T##String#>,
                                flight_icao: <#T##String#>,
                                flight_number: <#T##String#>,
                                flight_status: <#T##String#>,
                                live_altitude: <#T##Float#>,
                                live_direction: <#T##Float#>,
                                live_is_ground: <#T##Bool#>,
                                live_latitude: <#T##Float#>,
                                live_longitude: <#T##Float#>,
                                live_speed_horizontal: <#T##Float#>,
                                live_speed_vertical: <#T##Float#>,
                                live_updated: <#T##Date#>)

            }
        }
        
    }
    
}
