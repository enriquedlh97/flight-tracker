//
//  AirlineModel.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/11/21.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class AirlineModel: ObservableObject {
    
    @Published var airlines = [Airline]()
    private let db = Firestore.firestore()
    
    init() {
        
        fetchData()
        
    }
    
    // Function for getting data from the database
    func fetchData() {
        
        db.collection("airlines").order(by: "airline_name").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.airlines = documents.compactMap { queryDocumentSnapshot -> Airline? in
                return try? queryDocumentSnapshot.data(as: Airline.self)
                
            }
            
        }
        
    }
    
    // Fucntion for adding data to the database
    func addData(airline: Airline) {
        
        do {
            let _ = try db.collection("airlines").addDocument(from: airline)
        }
        catch {
            print(error)
        }
        
    }
    
    // Funciton for updating data from the database
    func updateData(airline: Airline) {
        
        if let airlineID = airline.id {
            do {
                try db.collection("airlines").document(airlineID).setData(from: airline)
            }
            catch {
                print("There was an error while trying to update a flight \(error.localizedDescription).")
            }
        }
        
    }
    
    // Function for removing data from the DataBase
    func removeData(airline: Airline) {
        
        if let airlineID = airline.id {
            db.collection("airlines").document(airlineID).delete { (error) in
                if let error = error {
                    print("Error removing flight: \(error.localizedDescription)")
                }
            }
        }
        
    }
    
}
