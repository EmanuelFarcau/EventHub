//
//  ActionPurpleButton.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 08.12.2022.
//

import SwiftUI

struct ActionPurpleButton: View {
    @State private var icon: String
    @State private var title: String
    @State private var width: CGFloat
    var action:  () -> Void
    
    init(icon: String, title: String, width: CGFloat, action: @escaping () -> Void) {
        self.icon = icon
        self.title = title
        self.width = width
        self.action = action
    }
    
    var body: some View {
       
        Button(action: {
              action()
        }) {
            HStack{
                Image(icon)
                    .renderingMode(.template).foregroundColor(Color("Purple50"))
                    
                Text(title)
            }
                .font(.system(size: 13).bold())
                .frame(width: width, height: 40)
                
        }.foregroundColor(Color("Purple50"))
            .overlay(RoundedRectangle(cornerRadius: 35).stroke(lineWidth:1).foregroundColor(Color("Purple50")))
        
    }
}

struct ActionPurpleButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionPurpleButton(icon: "calendar",title: "Adaugă în calendar", width: 200){
            
        }
    }
}
