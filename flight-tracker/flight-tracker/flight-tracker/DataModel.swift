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
    
    @Published var flight: Flight
    
    init() {
        getFlight()
    }
    
    func getFlight() {
        
        let URL = "https://api.aviationstack.com/v1/flights?access_key=\(apikey)"
        
    }
    
}
