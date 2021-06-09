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
    
    func addData(flight: Flight) {
        
        do {
            let _ = try db.collection("flights").addDocument(from: flight)
        }
        catch {
            print(error)
        }
        
    }
    
}
