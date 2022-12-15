//
//  RandomEvents.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 13.12.2022.
//

import SwiftUI

struct RandomEvents: View {
    
    var events: [Event]
    
    init(events: [Event]) {
        self.events = events
    }
    
    var body: some View {
        
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(events) { event in
                        EventCard(event: event)
                    }
                }
            }
        }

    }
}

//struct RandomEvents_Previews: PreviewProvider {
//    static var previews: some View {
//        RandomEvents()
//    }
//}
