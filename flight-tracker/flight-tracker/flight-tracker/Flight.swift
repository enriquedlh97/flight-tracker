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
