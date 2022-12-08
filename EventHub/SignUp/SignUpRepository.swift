//
//  SignUpRepository.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 23.11.2022.
//

import Foundation
import Firebase
import FirebaseAuth

protocol SignUpRepositoryProtocol{
        func createUser(username: String, email: String, password: String, onResponse: @escaping(Result<Void, Error>) -> Void ) -> Void
}

final class SignUpRepository: SignUpRepositoryProtocol{
    
    func signUp(id: String, username: String, email: String, onResponse: @escaping(Result<Void, Error>) -> Void) -> Void {
        
      //  self.addUser(username: username, email: email)
        
        // Get a reference to the database
        let db = Firestore.firestore()
        // Add a document to a collection
        db.collection("users").document(id).setData(["username": username, "email": email]){ error in
            
            if let error = error {
                onResponse(.failure(error))            }
            else{
                //Handle the error
                onResponse(.success(()))
            }
        }
    }
    
    func createUser(username: String, email: String, password: String, onResponse: @escaping(Result<Void, Error>) -> Void ) -> Void {
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error{
                onResponse(.failure(error))
                return 
              //  self.errorMessage = error!.localizedDescription
            }
            let userID = result?.user.uid
            self.signUp(id: userID ?? "", username: username, email: email) { result in
                switch result{
                case .success:
                    onResponse(.success(()))
                case .failure(let error):
                    onResponse(.failure(error))
                    
                }
            }
        }
    }
}
