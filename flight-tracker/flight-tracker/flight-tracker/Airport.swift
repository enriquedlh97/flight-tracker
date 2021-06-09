//
//  Airport.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/9/21.
//

import  SwiftUI
import Foundation

struct Airport: Identifiable {
    
    var id = UUID() // Lets swift assign and id automatically
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
    
}

extension Airport {
    
    public static var dummy = [
        Airport(airport_name: "Anaa", iata_code: "AAA", icao_code: "NTGA", latitude: "-17.05", longitude: "-145.41667", geoname_id: "6947726", timezone: "Pacific/Tahiti", gmt: "-10", phone_number: nil, country_name: "French Polynesia", country_iso2: "PF", city_iata_code: "AAA")
    ]
    
}
