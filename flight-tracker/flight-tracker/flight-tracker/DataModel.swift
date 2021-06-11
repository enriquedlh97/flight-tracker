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
    private let db = Firestore.firestore()
    
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
                                live_updated: ISO8601DateFormatter().date(from: f.1["live"]["updated"].stringValue) ?? Date(),
                                saved: false)
                
                self.flightsList.append(flight)
                //print("\(flight.airline_iata)-\(flight.flight_number)")
                
            }
//                        self.flightsList.forEach { flight in
//                            print("\(flight.airline_iata)-\(flight.flight_number)")
//                        }
        }
        
    }
    
    func saved(flight_number: String) -> String {
        let saved_document = db.collection("flights").whereField("flight_number", isEqualTo: flight_number).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    return document.documentID
                }
            }
        }
    }
}
