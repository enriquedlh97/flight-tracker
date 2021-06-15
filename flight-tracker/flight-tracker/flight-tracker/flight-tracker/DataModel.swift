//
//  DataModel.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/10/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON
import FirebaseFirestore

class DataModel: ObservableObject {
    
    @Published var flightsList = [Flight]()
    @Published var airportsList = [Airport]()
    @Published var airlinesList = [Airline]()
    private let db = Firestore.firestore()
    
    init() {
        getFlights()
        getAirports()
        getAirlines()
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
                
                flight = Flight(//id: UUID().uuidString,
                    aircraft_iata: f.1["aircraft"]["iata"].stringValue,
                    aircraft_icao: f.1["aircraft"]["icao"].stringValue,
                    aircraft_icao24: f.1["aircraft"]["icao24"].stringValue,
                    aircraft_registration: f.1["aircraft"]["registration"].stringValue,
                    airline_iata: f.1["airline"]["iata"].stringValue,
                    airline_icao: f.1["airline"]["icao"].stringValue,
                    airline_name: f.1["airline"]["name"].stringValue,
                    arrival_airport: f.1["arrival"]["airport"].stringValue,
                    arrival_baggage: f.1["arrival"]["baggage"].stringValue,
                    arrival_delay: f.1["arrival"]["delay"].floatValue,
                    arrival_estimated: ISO8601DateFormatter().date(from: f.1["arrival"]["delay"].stringValue) ?? ISO8601DateFormatter().date(from: f.1["arrival"]["scheduled"].stringValue)!,
                    arrival_gate: f.1["arrival"]["gate"].stringValue,
                    arrival_iata: f.1["arrival"]["iata"].stringValue,
                    arrival_icao: f.1["arrival"]["icao"].stringValue,
                    arrival_scheduled: ISO8601DateFormatter().date(from: f.1["arrival"]["scheduled"].stringValue)!,
                    arrival_terminal: f.1["arrival"]["terminal"].stringValue,
                    arrival_timezone: f.1["arrival"]["timezone"].stringValue,
                    departure_airport: f.1["departure"]["airport"].stringValue,
                    departure_delay: f.1["departure"]["delay"].floatValue,
                    departure_estimated: ISO8601DateFormatter().date(from: f.1["departure"]["estimated"].stringValue) ?? ISO8601DateFormatter().date(from: f.1["departure"]["scheduled"].stringValue)!,
                    departure_gate: f.1["departure"]["gate"].stringValue,
                    departure_iata: f.1["departure"]["iata"].stringValue,
                    departure_icao: f.1["departure"]["icao"].stringValue,
                    departure_scheduled: ISO8601DateFormatter().date(from: f.1["departure"]["scheduled"].stringValue)!,
                    departure_terminal: f.1["departure"]["terminal"].stringValue,
                    departure_timezone: f.1["departure"]["timezone"].stringValue,
                    flight_date: f.1["flight_date"].stringValue,
                    flight_iata: f.1["flight"]["iata"].stringValue,
                    flight_icao: f.1["flight"]["icao"].stringValue,
                    flight_number: f.1["flight"]["number"].stringValue,
                    flight_status: f.1["flight_status"].stringValue,
                    live_altitude: f.1["live"]["altitude"].floatValue,
                    live_direction: f.1["live"]["direction"].floatValue,
                    live_is_ground: f.1["live"]["altitude"].boolValue,
                    live_latitude: f.1["live"]["latitude"].floatValue,
                    live_longitude: f.1["live"]["longitude"].floatValue,
                    live_speed_horizontal: f.1["live"]["speed_horizontal"].floatValue,
                    live_speed_vertical: f.1["live"]["speed_vertical"].floatValue,
                    live_updated: ISO8601DateFormatter().date(from: f.1["live"]["updated"].stringValue) ?? Date())
                
                self.flightsList.append(flight)
                //print("\(flight.airline_iata)-\(flight.flight_number)")
                
            }
            //                        self.flightsList.forEach { flight in
            //                            print("\(flight.airline_iata)-\(flight.flight_number)")
            //                        }
        }
        
    }
    
    func getAirports() {
        
        let URL = "http://api.aviationstack.com/v1/airports?access_key=\(apikey)"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default).responseData { data in
            
            let json = try! JSON(data: data.data!)
            var airport: Airport
            for a in json["data"] {
                
                airport = Airport(airport_name: a.1["airport_name"].stringValue,
                                  iata_code: a.1["iata_code"].stringValue,
                                  icao_code: a.1["icao_code"].stringValue,
                                  latitude: a.1["latitude"].stringValue,
                                  longitude: a.1["longitude"].stringValue,
                                  geoname_id: a.1["geoname_id"].stringValue,
                                  timezone: a.1["timezone"].stringValue,
                                  gmt: a.1["gmt"].stringValue,
                                  phone_number: a.1["phone_number"].stringValue,
                                  country_name: a.1["country_name"].stringValue,
                                  country_iso2: a.1["country_iso2"].stringValue,
                                  city_iata_code: a.1["country_iso2"].stringValue,
                                  flag: "https://disease.sh/assets/img/flags/\(a.1["country_iso2"].stringValue.lowercased()).png")
                
                self.airportsList.append(airport)
                
            }
    
        }
        
    }
    
    func getAirlines() {
        
        let URL = "http://api.aviationstack.com/v1/airlines?access_key=\(apikey)"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default).responseData { data in
            
            let json = try! JSON(data: data.data!)
            var airline: Airline
            for a in json["data"] {
                
                airline = Airline(airline_name: a.1["airline_name"].stringValue,
                                  iata_code: a.1["iata_code"].stringValue,
                                  iata_prefix_accounting: a.1["iata_prefix_accounting"].stringValue,
                                  icao_code: a.1["icao_code"].stringValue,
                                  callsign: a.1["callsign"].stringValue,
                                  type: a.1["type"].stringValue,
                                  status: a.1["status"].stringValue,
                                  fleet_size: a.1["fleet_size"].stringValue,
                                  fleet_average_age: a.1["fleet_average_age"].stringValue,
                                  date_founded: a.1["date_founded"].stringValue,
                                  hub_code: a.1["hub_code"].stringValue,
                                  country_name: a.1["country_name"].stringValue,
                                  country_iso2: a.1["country_iso2"].stringValue,
                                  flag: "https://disease.sh/assets/img/flags/\(a.1["country_iso2"].stringValue.lowercased()).png")
                
                self.airlinesList.append(airline)
                
            }
    
        }
        
    }
    
}
