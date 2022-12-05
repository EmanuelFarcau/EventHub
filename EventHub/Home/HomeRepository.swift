//
//  HomeRepository.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 28.11.2022.
//

import Foundation

protocol HomeRepositoryProtocol {
    func getEvents() -> String
}

final class HomeRepository: HomeRepositoryProtocol {
    func getEvents() -> String {
        " "
    }
}
