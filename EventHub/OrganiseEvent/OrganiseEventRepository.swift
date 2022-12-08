//
//  OrganiseEventRepository.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 06.12.2022.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

protocol OrganiseEventRepositoryProtocol {
    func createEvent(name: String, date: Date, image: UIImage, location: String, description: String, onResponse: @escaping(Result<Void, Error>) -> Void) -> Void
}

final class OrganiseEventRepository: OrganiseEventRepositoryProtocol {

    @Published var events = [Event]()


    func createEvent(name: String, date: Date, image: UIImage, location: String, description: String, onResponse: @escaping (Result<Void, Error>) -> Void) {
        
        let db = Firestore.firestore()
        
        db.collection("events").addDocument(data: ["name" : name, "date": date, "image": image, "location": location, "description": description]){ error in
            
        }
                
    }
    
//    func getUsers(){
//          let db = Firestore.firestore()
//
//            db.collection("events").getDocuments{ snapshot, error in
//                // check for errors
//
//
//
//                if error == nil {
//
//                    if let snapshot = snapshot{
//
//                    DispatchQueue.main.async {
//                            //Get all documents and creat Users
//
//                                self.events = snapshot.documents.map { d in
//
//                                    return Event(id: d.documentID,
//                                                username: d["username"] as? String ?? "",
//                                                email: d["email"] as? String ?? "")
//                            }
//                        }
//                    }
//                }
//            }
//        }
    
    
}
