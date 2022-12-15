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
import FirebaseFirestore
import FirebaseStorage

protocol OrganiseEventRepositoryProtocol {
    func createEvent(name: String, date: Date, image: UIImage, location: String, description: String, numberOfParticipants: String, onResponse: @escaping(Result<Void, Error>) -> Void) -> Void
}

final class OrganiseEventRepository: OrganiseEventRepositoryProtocol {

    @Published var events = [Event]()


    func createEvent(name: String, date: Date, image: UIImage, location: String, description: String, numberOfParticipants: String, onResponse: @escaping (Result<Void, Error>) -> Void) {
        
//        guard image != nil else{
//            return
//        }
//
//        let storageRef = Storage.storage().reference()
//
//        let imageData = image.jpegData(compressionQuality: 0.8)
//
//        guard imageData != nil else{
//            return
//        }
//
//        let path = "images/\(UUID().uuidString).jpg"
//        let fileRef = storageRef.child(path)
//
//        let uploadTask = fileRef.putData(imageData!, metadata: nil) { metadata,
//            error in
//
//            if error == nil  && metadata != nil{
//                let db = Firestore.firestore()
//                db.collection("events").document().setData( ["name" : name, "date": date, "image": path, "location": location, "description": description, "numberOfParticipants": numberOfParticipants])
//            }
//
//
//        }
        
        let db = Firestore.firestore()
        self.uploadPhoto(image: image){ result in
            switch result{
            case .success(let url):
                onResponse(.success((
                    db.collection("events").document().setData( ["name" : name, "date": date, "image": url.absoluteString, "location": location, "description": description, "numberOfParticipants": numberOfParticipants])
                )))
            case .failure(let error):
                onResponse(.failure(error))

            }
        }
//
//        db.collection("events").document().setData( ["name" : name, "date": date, "image": , "location": location, "description": description]){ error in
//
//        }
    }
    
    func uploadPhoto (image: UIImage, onResponse: @escaping(Result<URL, Error>) -> Void ) -> Void{
        guard image != nil else{
            return
        }
        
        let storageRef = Storage.storage().reference()
        
        let imageData = image.jpegData(compressionQuality: 0.8)
        
        guard imageData != nil else{
            return
        }
        
        let path = "images/\(UUID().uuidString).jpg"
        let fileRef = storageRef.child(path)
        
        let uploadTask = fileRef.putData(imageData!, metadata: nil) { metadata,
            error in
            
            if let error = error {
                // onResponse(.failure(error))
                print(error)
            }
            else{
                //Handle the error
                fileRef.downloadURL{ url, error in
                    if let error = error{
                        onResponse(.failure(error))
                    }else{
                        onResponse(.success(url!))
                    }
                }
            }
        }
    }
    
    
   
}
