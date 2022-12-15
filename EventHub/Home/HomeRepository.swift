//
//  HomeRepository.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 28.11.2022.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore

protocol HomeRepositoryProtocol {
    func getEvents() async -> [Event]
    func getEventsByLocation() async -> [Event]
    func getPopularEvents() async -> [Event]
}

final class HomeRepository: HomeRepositoryProtocol {
    
    let db = Firestore.firestore()
    
    
    
    func getEvents() async -> [Event] {

        let query = try? await db.collection("events").getDocuments()

            let events = query?.documents.compactMap { try? $0.data(as: Event.self) } ?? []

            return events

    }
    
    func getEventsByLocation() async -> [Event]{
         
        let query = try? await db.collection("events").whereField("location", isEqualTo: "Oradea Romania").limit(to: 10).getDocuments()
        
        let locationEvents = query?.documents.compactMap { try? $0.data(as: Event.self) } ?? []
        
        return locationEvents
    }
    
    func getPopularEvents() async -> [Event]{
         
        let query = try? await db.collection("events").order(by: "numberOfParticipants", descending: true).limit(to: 10).getDocuments()
        
        let popularEvents = query?.documents.compactMap { try? $0.data(as: Event.self) } ?? []
        
        return popularEvents
    }
}
