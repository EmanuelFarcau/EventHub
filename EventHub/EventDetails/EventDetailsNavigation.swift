//
//  EventDetailsNavigation.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 08.12.2022.
//

import Foundation

protocol EventDetailsNavigationProtocol{
    var onClose: (() -> Void)? {get set}
    
    var onGoToHome: (() -> Void)? {get set}
}

struct EventDetailsNavigation: EventDetailsNavigationProtocol {
    var onClose: (() -> Void)?
    
    var onGoToHome: (() -> Void)?
}
