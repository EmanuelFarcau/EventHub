//
//  LocationEvents.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 14.12.2022.
//

import SwiftUI

struct LocationEvents: View {
    var locationEvents: [Event]
    
    init(locationEvents: [Event]) {
        self.locationEvents = locationEvents
    }
    
    var body: some View {
        
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(locationEvents) { event in
                        EventCard(event: event)
                    }
                }
            }
        }

    }
}

//struct LocationEvents_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationEvents()
//    }
//}
