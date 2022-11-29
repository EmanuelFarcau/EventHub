//
//  SignUpViewModel.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 23.11.2022.
//

import SwiftUI
import Firebase


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
    
    func signUp()
    func onGoToSignIn()
    func close()
}

final class SignUpViewModel: SignUpViewModelProtocol {
    var errorMessage: String = ""
    
    @Published var isError: Bool = false
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    var confirmPassword: String = ""
    
    
    

    private let repository: SignUpRepositoryProtocol
    private let navigation: SignUpNavigationProtocol
    
    init(repository: SignUpRepositoryProtocol, navigation: SignUpNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
    }
    
    func signUp(){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if error != nil{
                self.isError = true
                self.errorMessage = error!.localizedDescription
                print(error!.localizedDescription)
              //  self.errorMessage = error!.localizedDescription
            }
        }
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


