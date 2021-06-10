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
            //print(json.count)
            var flight: Flight
            for f in json["results"] {
                flight = Flight(id: <#T##String?#>, aircraft_iata: <#T##String#>, aircraft_icao: <#T##String#>, aircraft_icao24: <#T##String#>, aircraft_registration: <#T##String#>, airline_iata: <#T##String#>, airline_icao: <#T##String#>, airline_name: <#T##String#>, arrival_airport: <#T##String#>, arrival_baggage: <#T##String#>, arrival_delay: <#T##Float#>, arrival_estimated: <#T##Date#>, arrival_gate: <#T##String#>, arrival_iata: <#T##String#>, arrival_icao: <#T##String#>, arrival_scheduled: <#T##Date#>, arrival_terminal: <#T##String#>, arrival_timezone: <#T##String#>, departure_airport: <#T##String#>, departure_delay: <#T##Float#>, departure_estimated: <#T##Date#>, departure_gate: <#T##String#>, departure_iata: <#T##String#>, departure_icao: <#T##String#>, departure_scheduled: <#T##Date#>, departure_terminal: <#T##String#>, departure_timezone: <#T##String#>, flight_date: <#T##String#>, flight_iata: <#T##String#>, flight_icao: <#T##String#>, flight_number: <#T##String#>, flight_status: <#T##String#>, live_altitude: <#T##Float#>, live_direction: <#T##Float#>, live_is_ground: <#T##Bool#>, live_latitude: <#T##Float#>, live_longitude: <#T##Float#>, live_speed_horizontal: <#T##Float#>, live_speed_vertical: <#T##Float#>, live_updated: <#T##Date#>)
            }
        }
        
    }
    
}
