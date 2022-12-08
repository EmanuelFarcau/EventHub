//
//  OrganiseEventNavigation.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 06.12.2022.
//

import Foundation

protocol OrganiseEventNavigationProtocol{
    var onClose: (() -> Void)? {get set}
}

struct OrganiseEventNavigation: OrganiseEventNavigationProtocol{
        var onClose: (() -> Void)?
}
