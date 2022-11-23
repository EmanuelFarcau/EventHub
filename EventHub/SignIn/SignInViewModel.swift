//
//  SignInViewModel.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 22.11.2022.
//

import SwiftUI

protocol SignInViewModelProtocol: ObservableObject{
    func close()
}



final class SignInViewModel: SignInViewModelProtocol {
  //  @Published var users = [String]()
    let repository: SignInRepositoryProtocol
    let navigation: SignInNavigationProtocol
    
    init(users: [String] = [String](), repository: SignInRepositoryProtocol, navigation: SignInNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
    }
    
    func close() {
        navigation.onClose?()
    }
    
}


