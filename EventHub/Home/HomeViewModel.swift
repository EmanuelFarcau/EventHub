//
//  HomeViewModel.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 28.11.2022.
//

import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    
    func goToOrganiseEvent()
    func close()
}

final class HomeViewModel: HomeViewModelProtocol {
    // @Published var events = [String] ()
    private let repository: HomeRepositoryProtocol
    private let navigation: HomeNavigationProtocol
    
    init(repository: HomeRepositoryProtocol, navigation: HomeNavigationProtocol){
        self.repository = repository
        self.navigation = navigation
    }
    
    func goToOrganiseEvent(){
        navigation.onGoToOrganiseEvent?()
    }
    
    func close() {
        navigation.onClose?()
    }
}

