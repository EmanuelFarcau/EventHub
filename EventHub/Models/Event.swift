//
//  Event.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 07.12.2022.
//

import Foundation
import SwiftUI

struct Event: Identifiable {
    
    var id: String
    var name: String
    var date: Date
    var image: UIImage
    var location: String
    var description: String
    
}
