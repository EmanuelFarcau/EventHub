//
//  EventDetailsViewModel.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 08.12.2022.
//

import SwiftUI
import Firebase

protocol EventDetailsViewModelProtocol: ObservableObject{
    
    func goToHome()
    
}

final class EventDetailsViewModel: EventDetailsViewModelProtocol {
  
    private let repository: EventDetailsRepositoryProtocol
    private let navigation: EventDetailsNavigationProtocol
    
    init(repository: EventDetailsRepositoryProtocol, navigation: EventDetailsNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
    }
    
    func goToHome() {
        navigation.onGoToHome?()
    }
}

