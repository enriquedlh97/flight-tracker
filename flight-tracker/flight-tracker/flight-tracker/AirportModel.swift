//
//  AirportModel.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/11/21.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class AirportModel: ObservableObject {
    
    @Published var airports = [Airport]()
    private let db = Firestore.firestore()
    
    init() {
        
        fetchData()
        
    }
    
    // Function for getting data from the database
    func fetchData() {
        
        db.collection("airports").order(by: "airport_name").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.airports = documents.compactMap { queryDocumentSnapshot -> Airport? in
                return try? queryDocumentSnapshot.data(as: Airport.self)
                
            }
            
        }
        
    }
    
    // Fucntion for adding data to the database
    func addData(airport: Airport) {
        
        do {
            let _ = try db.collection("airports").addDocument(from: airport)
        }
        catch {
            print(error)
        }
        
    }
    
    // Funciton for updating data from the database
    func updateData(airport: Airport) {
        
        if let airportID = airport.id {
            do {
                try db.collection("airports").document(airportID).setData(from: airport)
            }
            catch {
                print("There was an error while trying to update a flight \(error.localizedDescription).")
            }
        }
        
    }
    
    // Function for removing data from the DataBase
    func removeData(airport: Airport) {
        
        if let airportID = airport.id {
            db.collection("flights").document(airportID).delete { (error) in
                if let error = error {
                    print("Error removing flight: \(error.localizedDescription)")
                }
            }
        }
        
    }
    
}
