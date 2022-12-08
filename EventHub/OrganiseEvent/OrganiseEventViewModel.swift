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
    var numberOfPeople: String {get set}
    var location: String{get set}
    var description: String {get set}

}

final class OrganiseEventViewModel: OrganiseEventViewModelProtocol {
    @Published var numberOfPeople: String = ""
    
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
        
    }
    
}

