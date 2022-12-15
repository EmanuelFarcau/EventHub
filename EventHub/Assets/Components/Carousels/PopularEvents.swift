//
//  PopularEvents.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 14.12.2022.
//

import SwiftUI

struct PopularEvents: View {
    var popularEvents: [Event]
 
    
    init(popularEvents: [Event]) {
        self.popularEvents = popularEvents
    }
    
    var body: some View {
        
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    
                    ForEach(popularEvents) { event in
                        EventCard(event: event)
                    }
                }
            }
        }

    }
}

