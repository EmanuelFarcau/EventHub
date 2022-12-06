//
//  TopEvent.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 05.12.2022.
//

import SwiftUI

struct TopEvent: View {
    var body: some View {
        ZStack{
            Color("BackgroundWhite").ignoresSafeArea()
            
            
            VStack(alignment: .leading){
                
                
                ZStack(alignment: .leading){
                    Image("VanGogh")
                        .frame(width: 159, height: 109)
                        .cornerRadius(16)
                    
                    VStack{
                        Text(String(1))
                            .foregroundColor(Color("Purple50"))
                    }.frame(width: 40, height: 40)
                        .background(Color(.lightGray))
                    .cornerRadius(8)
                    .padding(.bottom, 55)
                    .padding(.leading, 5)
                    
                }
                    
                
                Text("Event title")
                    .font(.system(size: 13).bold())
                    .padding(.bottom, 1)
                
                HStack{
                    Text("26 OCT")
                        .font(.system(size: 13))
                    Text("17:00")
                        .font(.system(size: 13))
                }
                
                
            }.frame(width: 175, height: 189)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 1).foregroundColor(Color("BackgroundWhite")))
                .background(.white)
                .cornerRadius(16)
            
        }
    }
}

struct TopEvent_Previews: PreviewProvider {
    static var previews: some View {
        TopEvent()
    }
}
