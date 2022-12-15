//
//  DetailsTopView.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 08.12.2022.
//

import SwiftUI

struct DetailsTopView: View {
    
    
    
    var body: some View {
        
        
        VStack(alignment: .leading){
            VStack{
                Image("image 12")
                    .resizable()
            }.frame( minWidth: 0,
                     maxWidth: .infinity,
                     minHeight: 0,
                     maxHeight: 270
            )
            .cornerRadius(35)
            
            Text("🎵 Muzică")
                .padding(.top, 5)
                .padding(.bottom, 5)
                .padding(.leading)
            .font(.system(size: 13).bold())
            .foregroundColor(Color("Purple50"))
            Text("Depeche Mode în București -  Memento Mori Tour")
                .padding(.leading)
                .font(.system(size: 24).bold())
        }
    }
}

struct DetailsTopView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsTopView()
    }
}
