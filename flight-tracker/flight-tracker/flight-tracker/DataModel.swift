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
                                arrival_estimated: ISO8601DateFormatter().date(from: f.1["arrival"]["delay"].stringValue)!,
                                arrival_gate: f.1["arrival"]["gate"].stringValue,
                                arrival_iata: f.1["arrival"]["iata"].stringValue,
                                arrival_icao: f.1["arrival"]["icao"].stringValue,
                                arrival_scheduled: ISO8601DateFormatter().date(from: f.1["arrival"]["scheduled"].stringValue)!,
                                arrival_terminal: f.1["arrival"]["terminal"].stringValue,
                                arrival_timezone: f.1["arrival"]["timezone"].stringValue,
                                departure_airport: f.1["departure"]["airport"].stringValue,
                                departure_delay: f.1["departure"]["delay"].floatValue,
                                departure_estimated: ISO8601DateFormatter().date(from: f.1["departure"]["estimated"].stringValue)!,
                                departure_gate: f.1["departure"]["gate"].stringValue,
                                departure_iata: f.1["departure"]["iata"].stringValue,
                                departure_icao: f.1["departure"]["icao"].stringValue,
                                departure_scheduled: ISO8601DateFormatter().date(from: f.1["departure"]["scheduled"].stringValue)!,
                                departure_terminal: f.1["departure"]["terminal"].stringValue,
                                departure_timezone: f.1["departure"]["timezone"].stringValue,
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
