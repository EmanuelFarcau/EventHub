//
//  OrganiseEventViewModel.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 06.12.2022.
//

import SwiftUI

protocol OrganiseEventViewModelProtocol: ObservableObject {
    
    var name: String{get set}
    var date: Date{get set}
    var image: UIImage {get set}
    var numberOfParticipants: String {get set}
    var location: String{get set}
    var description: String {get set}
    
    func createEvent()
    
    func goToHome()

}

final class OrganiseEventViewModel: OrganiseEventViewModelProtocol {
    
    @Published var numberOfParticipants: String = ""
    
    @Published var location: String = "Oradea Romania"
    
    @Published var description: String = ""
    
    @Published var name: String = ""
    
    @Published var date: Date = Date()
    
    @Published var image: UIImage = UIImage()
    
    
    
    
    private let repository: OrganiseEventRepositoryProtocol
    private let navigation: OrganiseEventNavigationProtocol
    
    init(repository: OrganiseEventRepositoryProtocol, navigation: OrganiseEventNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
    }
    
    //    func onlyDigits() -> Bool {
    //        //numberOfPeople
    //    }
    
    func createEvent(){
        repository.createEvent(name: name, date: date, image: image, location: location, description: description, numberOfParticipants: numberOfParticipants) { result in
            switch result{
            case .success:
                print("o mars")
            case .failure(let error):
                print(error)
                //
            }
        }
    }
    func goToHome(){
        navigation.onGoToHome?()
    }
}
