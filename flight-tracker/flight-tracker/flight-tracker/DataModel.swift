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
            //print(json["data"])
            var flight: Flight
            for f in json["data"] {
                print(f)

            }
        }
        
    }
    
}
