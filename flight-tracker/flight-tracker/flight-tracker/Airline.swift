//
//  Airline.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/9/21.
//

import SwiftUI
import Foundation
import FirebaseFirestoreSwift

struct Airline: Identifiable, Codable {
    
    @DocumentID var id: String? // Uses firebase to generate an id autoamtically
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
    var flag: String // url to the flag of the country where th airline was founded
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case airline_name
        case iata_code
        case iata_prefix_accounting
        case icao_code
        case callsign
        case type
        case status
        case fleet_size
        case fleet_average_age
        case date_founded
        case hub_code
        case country_name
        case country_iso2
        case flag
        
    }
    
}

extension Airline {
    
    public static var dummy = [
        Airline(airline_name: "American Airlines", iata_code: "AA", iata_prefix_accounting: "1", icao_code: "AAL", callsign: "AMERICAN", type: "scheduled", status: "active", fleet_size: "963", fleet_average_age: "10.9", date_founded: "1934", hub_code: "DFW", country_name: "United States", country_iso2: "US", flag: "https://disease.sh/assets/img/flags/us.png")
    ]
    
}
