//
//  SignInViewModel.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 22.11.2022.
//

import SwiftUI

protocol SignInViewModelProtocol: ObservableObject{
    
    func goToSignUp()
    func close()
}



final class SignInViewModel: SignInViewModelProtocol {
  //  @Published var users = [String]()
    private let repository: SignInRepositoryProtocol
    private let navigation: SignInNavigationProtocol
    
    init(users: [String] = [String](), repository: SignInRepositoryProtocol, navigation: SignInNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
    }
    
    func goToSignUp() {
        navigation.onGoToSignUp?()
    }
    
    func close() {
        navigation.onClose?()
    }
    
}


