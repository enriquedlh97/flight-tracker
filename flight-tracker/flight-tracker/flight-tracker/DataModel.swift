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
    
    @Published var flight = [Flight]()
    
    init() {
        getFlight()
    }
    
    func getFlight() {
        
        let URL = "http://api.aviationstack.com/v1/flights?access_key=\(apikey)"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default).responseData { data in
            
            let json = try! JSON(data: data.data!)
            print(json.count)
        }
        
    }
    
}
