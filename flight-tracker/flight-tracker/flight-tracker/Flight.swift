//
//  Flight.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/8/21.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Flight: Identifiable, Codable {
    
    @DocumentID var id: String? // Uses firebase to generate an id autoamtically
    var aircraft_iata: String
    var aircraft_icao: String
    var aircraft_icao24: String
    var aircraft_registration: String
    var airline_iata: String
    var airline_icao: String
    var airline_name: String
    var arrival_airport: String
    var arrival_baggage: String
    var arrival_delay: Float
    var arrival_estimated: Date
    var arrival_gate: String
    var arrival_iata: String
    var arrival_icao: String
    var arrival_scheduled: Date
    var arrival_terminal: String
    var arrival_timezone: String
    var departure_airport: String
    var departure_delay: Float
    var departure_estimated: Date
    var departure_gate: String
    var departure_iata: String
    var departure_icao: String
    var departure_scheduled: Date
    var departure_terminal: String
    var departure_timezone: String
    var flight_date: String
    var flight_iata: String
    var flight_icao: String
    var flight_number: String
    var flight_status: String
    var live_altitude: Float
    var live_direction: Float
    var live_is_ground: Bool
    var live_latitude: Float
    var live_longitude: Float
    var live_speed_horizontal: Float
    var live_speed_vertical: Float
    var live_updated: Date
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case aircraft_iata
        case aircraft_icao
        case aircraft_icao24
        case aircraft_registration
        case airline_iata
        case airline_icao
        case airline_name
        case arrival_airport
        case arrival_baggage
        case arrival_delay
        case arrival_estimated
        case arrival_gate
        case arrival_iata
        case arrival_icao
        case arrival_scheduled
        case arrival_terminal
        case arrival_timezone
        case departure_airport
        case departure_delay
        case departure_estimated
        case departure_gate
        case departure_iata
        case departure_icao
        case departure_scheduled
        case departure_terminal
        case departure_timezone
        case flight_date
        case flight_iata
        case flight_icao
        case flight_number
        case flight_status
        case live_altitude
        case live_direction
        case live_is_ground
        case live_latitude
        case live_longitude
        case live_speed_horizontal
        case live_speed_vertical
        case live_updated
        
    }
    
}

extension Flight {
    
    public static var dummy = [
        Flight(aircraft_iata: "A321", aircraft_icao: "A321", aircraft_icao24: "A0F1BB", aircraft_registration: "N160AN", airline_iata: "AA", airline_icao: "AAL", airline_name: "American Airlines", arrival_airport: "Dallas/Fort Worth International", arrival_baggage: "A17", arrival_delay: 0, arrival_estimated: ISO8601DateFormatter().date(from: "2019-12-12T04:20:00+00:00")!, arrival_gate: "A22", arrival_iata: "DFW", arrival_icao: "KDFW", arrival_scheduled: ISO8601DateFormatter().date(from: "2019-12-12T04:20:00+00:00")!, arrival_terminal: "A", arrival_timezone: "America/Chicago", departure_airport: "San Francisco International", departure_delay: 13, departure_estimated: ISO8601DateFormatter().date(from: "2019-12-12T04:20:00+00:00")!, departure_gate: "D11", departure_iata: "SFO", departure_icao: "KSFO", departure_scheduled: ISO8601DateFormatter().date(from: "2019-12-12T04:20:00+00:00")!, departure_terminal: "2", departure_timezone: "America/Los_Angeles", flight_date: "2019-12-12", flight_iata: "AA1004", flight_icao: "AAL1004", flight_number: "1004", flight_status: "active", live_altitude: 8846.82, live_direction: 114.34, live_is_ground: false, live_latitude: 36.2856, live_longitude: -106.807, live_speed_horizontal: 894.348, live_speed_vertical: 1.188, live_updated: ISO8601DateFormatter().date(from: "2019-12-12T10:00:00+00:00")!)
    ]
    
}
