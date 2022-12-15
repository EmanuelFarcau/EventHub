//
//  Event.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 07.12.2022.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct Event: Identifiable, Decodable {
    
    @DocumentID var id: String?
    var name: String
    var date: Date
    var image: String
    var location: String
    var numberOfParticipants: String
    var description: String
    
}
