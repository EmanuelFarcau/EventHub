//
//  SignUpNavigation.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 23.11.2022.
//

import Foundation

protocol SignUpNavigationProtocol{
    var onClose: (() -> Void)? {get set}
    var onGoToSignIn: (() -> Void)? {get set}
}

struct SignUpNavigation: SignUpNavigationProtocol{
    var onGoToSignIn: (() -> Void)?
    
    var onClose: (() -> Void)?
}
