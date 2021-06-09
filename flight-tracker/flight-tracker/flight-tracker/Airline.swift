//
//  Airline.swift
//  flight-tracker
//
//  Created by user189351 on 6/9/21.
//

import SwiftUI

struct Airline: Identifiable {
    
    var id = UUID() // Lets swift assign and id automatically
    var airline_name: String // the full name of the airline.
    var iata_code: String // the IATA code of the airline.
    var iata_prefix_accounting: String //  the IATA prefix or accounting code of the airline.
    var icao_code: String // the ICAO code of the airline.
    var callsign: String // the ICAO callsign of the airline.
    var type: String // the type of airline.
    var status: String // the current status of the airline.
    var fleet_size: String // the fleet size of the airline.
    var fleet_average_age: String // the average aircraft age of the fleet.
    var date_founded: String // the founding year of the airline.
    var hub_code: String // the hub code associated with the airline
    var country_name: String // the name of the origin country of the airline.
    var country_iso2: String // the 2-letter ISO code of the origin country of the airline.
    
}

extension Airline {
    
    public static var dummy = [
    Airline(airline_name: "American Airlines", iata_code: "AA", iata_prefix_accounting: "1", icao_code: "AAL", callsign: "AMERICAN", type: "scheduled", status: "active", fleet_size: "963", fleet_average_age: "10.9", date_founded: "1934", hub_code: "DFW", country_name: "United States", country_iso2: "US")
    ]
    
}
