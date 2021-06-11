//
//  Airport.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/9/21.
//

import  SwiftUI
import Foundation
import FirebaseFirestoreSwift

struct Airport: Identifiable, Codable {
    
    @DocumentID var id: String? // Uses firebase to generate an id autoamtically
    var airport_name: String // the full name of the airport.
    var iata_code: String // the IATA code associated with the airport.
    var icao_code: String // the ICAO code associated with the airport.
    var latitude: String // the latitude coordinate associated with the airport location.
    var longitude: String // the longitude coordinate associated with the airport location.
    var geoname_id: String // the GeoNames ID of the airport.
    var timezone: String // the timezone the airport is in. Example: America/Los_Angeles
    var gmt: String // the GMT offset in hours.
    var phone_number: String? // the phone number of the airport.
    var country_name: String // the name of the country the airport is in.
    var country_iso2: String // the ISO code of the country the airport is in.
    var city_iata_code: String // the IATA code of the city the airport is in.
    var flag: String // url to the flag of the country where th airport is located
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case airport_name
        case iata_code
        case icao_code
        case latitude
        case longitude
        case geoname_id
        case timezone
        case gmt
        case phone_number
        case country_name
        case country_iso2
        case city_iata_code
        case flag
        
    }
    
}

extension Airport {
    
    public static var dummy =
        Airport(airport_name: "Anaa", iata_code: "AAA", icao_code: "NTGA", latitude: "-17.05", longitude: "-145.41667", geoname_id: "6947726", timezone: "Pacific/Tahiti", gmt: "-10", phone_number: nil, country_name: "French Polynesia", country_iso2: "PF", city_iata_code: "AAA", flag: "https://disease.sh/assets/img/flags/pf.png")
    
    
}
