//
//  EventCard.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 08.12.2022.
//

import SwiftUI

//extension Date {
//    func weekDay() -> String? {
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "EEEE,"
//            return dateFormatter.string(from: self).capitalized            // or use capitalized(with: locale) if you want
//        }
//    var displayFormat: String{
//        self.formatted(
//            .dateTime
//                .day(.twoDigits)
//                .month(.abbreviated)
//        )
//    }
//}

struct EventCard: View {
    
    let event: Event
    
    init(event: Event) {
        self.event = event
    }
    
    var body: some View {
       
        
            
            VStack(alignment: .leading){
                
                
                ZStack(alignment: .leading){
                    AsyncImage(url: URL(string: event.image)){ phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 290, height: 160)
                                .cornerRadius(16)
                        case .failure:
                            Image ("")
                            
                        @unknown default:
                            EmptyView()
                        }
                    }

                        
                }.padding(.top, 10)
                    
                
                Text(event.name)
                    .font(.system(size: 13).bold())
                    .padding(.bottom, 1)
                    .padding(.leading, 3)
                
                HStack{
                    Text(event.date.displayFormat)
                    Image("Ellipse49")
                    Text("17:00")
                    Image("Ellipse49")
                    Text(event.location)
                }.padding(.leading, 3)
                    .font(.system(size: 13))
                    .foregroundColor(Color("Purple50"))
                
                HStack{
                    Image("Ellipse51")
                    Image("Ellipse52")
                    Image("Ellipse53")
                    Text("\(event.numberOfParticipants) participanti")
                }.font(.system(size: 13))
                    .foregroundColor(Color("Black20"))
                
                Spacer()
            }.frame(width: 310, height: 279)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 1).foregroundColor(Color("BackgroundWhite")))
                .background(.white)
                .cornerRadius(16)
            
        }
}

//struct EventCard_Previews: PreviewProvider {
//    static var previews: some View {
//        EventCard()
//    }
//}
