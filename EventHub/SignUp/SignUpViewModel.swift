//
//  SignUpViewModel.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 23.11.2022.
//

import SwiftUI
import Firebase
import FirebaseAuth


protocol SignUpViewModelProtocol: ObservableObject{
    var username: String{get set}
    var email: String{get set}
    var password: String{get set}
    var confirmPassword: String {get set}
    var isSignUpComplete: Bool{get}
    var confirmPwPrompt: String{get}
    var emailPrompt: String{get}
    var passwordPrompt: String{get}
    var isError: Bool{get set}
    var errorMessage: String {get set}
    
    func createUser()
    func onGoToSignIn()
    func close()
}

final class SignUpViewModel: SignUpViewModelProtocol {
    
    //
    @Published var errorMessage: String = ""
    
    @Published var isError: Bool = false
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var users = [User]()
    var confirmPassword: String = ""
    
    
    

    private let repository: SignUpRepositoryProtocol
    private let navigation: SignUpNavigationProtocol
    
    init(repository: SignUpRepositoryProtocol, navigation: SignUpNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
    }
    
//    func addUser(username: String, email: String){
//        // Get a reference to the database
//        let db = Firestore.firestore()
//        // Add a document to a collection
//        db.collection("users").addDocument(data: ["username": username, "email": email]){ error in
//
//            if error == nil {
//                self.getUsers()
//            }
//            else{
//                //Handle the error
//            }
//        }
//    }
    
//    func getUsers(){
//        let db = Firestore.firestore()
//
//        db.collection("users").getDocuments{ snapshot, error in
//            // check for errors
//
//
//
//            if error == nil {
//
//                if let snapshot = snapshot{
//
//                    DispatchQueue.main.async {
//                        //Get all documents and creat Users
//
//                            self.users = snapshot.documents.map { d in
//
//                                return User(id: d.documentID,
//                                            username: d["username"] as? String ?? "",
//                                            email: d["email"] as? String ?? "")
//                        }
//                    }
//                }
//            }
//        }
//    }
    
//    func signUp(id: String, username: String, email: String){
//
//      //  self.addUser(username: username, email: email)
//
//        // Get a reference to the database
//        let db = Firestore.firestore()
//        // Add a document to a collection
//        db.collection("users").document(id).setData(["username": username, "email": email]){ error in
//
//            if error == nil {
//                self.getUsers()
//            }
//            else{
//                //Handle the error
//            }
//        }
//    }
    
    func createUser() {
        repository.createUser(username: username, email: email, password: password) {result in
            switch result{
            case .success:
                print("o mars")
            case .failure(let error):
                self.isError = true
                self.errorMessage = error.localizedDescription
                print(error.localizedDescription)
                
            }
        }
//        Auth.auth().createUser(withEmail: email, password: password){ result, error in
//            if error != nil{
//                self.isError = true
//                self.errorMessage = error!.localizedDescription
//                print(error!.localizedDescription)
//              //  self.errorMessage = error!.localizedDescription
//            }
//            let userID = result?.user.uid
//            self.signUp(id: userID ?? "", username: self.username, email: self.email)
//        }
    }
    
    func onGoToSignIn(){
        navigation.onGoToSignIn?()
    }
    
    func passwordMatch() -> Bool{
        password == confirmPassword
    }
    
    func isPasswordValid() -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$")
        return passwordTest.evaluate(with: password)
    }
    
    func isEmailValid() -> Bool{
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: email)
    }
    
    var isSignUpComplete: Bool{
        if !passwordMatch() ||
            !isPasswordValid() ||
            !isEmailValid() {
            return false
        }
        return true
    }
    
    // Validation Strings
    
    var confirmPwPrompt: String {
        if passwordMatch(){
            return ""
        }else {
            return "Passwords does not match"
        }
    }
    
    var emailPrompt: String {
        if isEmailValid(){
            return ""
        } else{
            return "Enter a valid email"
        }
    }
    
    var passwordPrompt: String{
        if isPasswordValid(){
            return ""
        } else {
            return "Must be between 8 and 15 characters containing at least one number and one capital letter"
        }
    }
    
    func close() {
        navigation.onClose?()
    }
    
    
}


