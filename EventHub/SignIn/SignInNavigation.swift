//
//  SignInNavigation.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 22.11.2022.
//

import Foundation

protocol SignInNavigationProtocol{
    var onClose: (() -> Void)? {get set}
    var onGoToSignUp: (() -> Void)? {get set}
    var onGoToHome: (() -> Void)? {get set}
}

struct SignInNavigation: SignInNavigationProtocol{
    var onGoToSignUp: (() -> Void)?
    var onGoToHome: (() -> Void)?
    var onClose: (() -> Void)?
}
