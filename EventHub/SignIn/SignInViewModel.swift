//
//  SignInViewModel.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 22.11.2022.
//

import SwiftUI
import Firebase

protocol SignInViewModelProtocol: ObservableObject{
    var isError: Bool{get set}
    var errorMessage: String {get set}
    var email: String{get set}
    var password: String{get set}
    
    func login()
    func goToSignUp()
    func close()
}



final class SignInViewModel: SignInViewModelProtocol {
    @Published var isError: Bool = false
    var errorMessage: String = ""
    @Published var email = ""
    @Published var password = ""
    
  //  @Published var users = [String]()
    private let repository: SignInRepositoryProtocol
    private let navigation: SignInNavigationProtocol
    
    init(users: [String] = [String](), repository: SignInRepositoryProtocol, navigation: SignInNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) {result, error in
            if error != nil {
                if error != nil{
                    self.isError = true
                    self.errorMessage = error!.localizedDescription
                    print(error!.localizedDescription)
                }
            }
        }
    }
    
    func goToSignUp() {
        navigation.onGoToSignUp?()
    }
    
    func close() {
        navigation.onClose?()
    }
    
}


