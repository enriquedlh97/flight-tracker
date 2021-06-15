//
//  FlightModel.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/9/21.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class FlightModel: ObservableObject {
    
    @Published var flights = [Flight]()
    private let db = Firestore.firestore()
    
    init() {
        
        fetchData()
        
    }
    
    // Function for getting data from the database
    func fetchData() {
        
        db.collection("flights").order(by: "departure_scheduled").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.flights = documents.compactMap { queryDocumentSnapshot -> Flight? in
                return try? queryDocumentSnapshot.data(as: Flight.self)
                
            }
            
        }
        
    }
    
    // Fucntion for adding data to the database
    func addData(flight: Flight) {
        
        do {
            let _ = try db.collection("flights").addDocument(from: flight)
        }
        catch {
            print(error)
        }
        
    }
    
    // Funciton for updating data from the database
    func updateData(flight: Flight) {
        
        if let flightID = flight.id {
            do {
                try db.collection("flights").document(flightID).setData(from: flight)
            }
            catch {
                print("There was an error while trying to update a flight \(error.localizedDescription).")
            }
        }
        
    }
    
    // Function for removing data from the DataBase
    func removeData(flight: Flight) {
        
        if let flightID = flight.id {
            db.collection("flights").document(flightID).delete { (error) in
                if let error = error {
                    print("Error removing flight: \(error.localizedDescription)")
                }
            }
        }
        
    }
    
}
