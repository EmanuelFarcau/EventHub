//
//  HomeViewModel.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 28.11.2022.
//

import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    
    var events: [Event]{get set}
    var locationEvents: [Event]{get set}
    var popularEvents: [Event]{get set}

    
    func goToEventDetails()
    func goToOrganiseEvent()
    func close()
}

final class HomeViewModel: HomeViewModelProtocol {
    
    
    @Published var popularEvents = [Event]()
    
    @Published var locationEvents = [Event]()
    
    @Published var events = [Event]()
    
    private let repository: HomeRepositoryProtocol
    private let navigation: HomeNavigationProtocol
    
    init(repository: HomeRepositoryProtocol, navigation: HomeNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
        self.getLocationEvents()
        self.getEvents()
        self.getPopularEvents()
    }
    
    func goToEventDetails(){
        navigation.onGoToEventDetails?()
    }
    
    func goToOrganiseEvent(){
        navigation.onGoToOrganiseEvent?()
    }
    
    func getEventDetails(){
        navigation.onGoToEventDetails?()
    }
    
    func getPopularEvents(){
        Task {
            let response = await repository.getPopularEvents()
            popularEvents = response
        }
    }
    
    func getLocationEvents() {
        Task {
            let response = await repository.getEventsByLocation()
            locationEvents = response
        }
    }
    
    func getEvents() {
        Task {
          let response = await repository.getEvents()
            events = response
        }
    }
    
    func close() {
        navigation.onClose?()
    }
}

