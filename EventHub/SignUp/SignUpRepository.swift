//
//  SignUpRepository.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 23.11.2022.
//

import Foundation

protocol SignUpRepositoryProtocol{
    func getUser() -> String
}

final class SignUpRepository: SignUpRepositoryProtocol{
    func getUser() -> String {
        " "
    }
}
