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
}

struct SignInNavigation{
    var onClose: (() -> Void)?
    var onGoSignUp: (() -> Void)?
}
