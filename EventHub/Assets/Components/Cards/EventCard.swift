//
//  EventCard.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 08.12.2022.
//

import SwiftUI

struct EventCard: View {
    var body: some View {
       
            
            
            VStack(alignment: .leading){
                
                
                ZStack(alignment: .leading){
                    Image("image 12")
                        .frame(width: 290, height: 160)
                        .cornerRadius(16)
                }.padding(.top, 10)
                    
                
                Text("Depeche Mode în București -  Memento Mori Tour")
                    .font(.system(size: 13).bold())
                    .padding(.bottom, 1)
                    .padding(.leading, 3)
                
                HStack{
                    Text("26 OCT")
                    Image("Ellipse49")
                    Text("17:00")
                    Image("Ellipse49")
                    Text("Locatie")
                }.padding(.leading, 3)
                    .font(.system(size: 13))
                    .foregroundColor(Color("Purple50"))
                
                HStack{
                    Image("Ellipse51")
                    Image("Ellipse52")
                    Image("Ellipse53")
                    Text("2.5k participanti")
                }.font(.system(size: 13))
                    .foregroundColor(Color("Black20"))
                
                Spacer()
            }.frame(width: 310, height: 279)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 1).foregroundColor(Color("BackgroundWhite")))
                .background(.white)
                .cornerRadius(16)
            
        }


}

struct EventCard_Previews: PreviewProvider {
    static var previews: some View {
        EventCard()
    }
}
