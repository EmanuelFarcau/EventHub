//
//  PurpleButton.swift
//  EventHub
//
//  Created by internship on 21.11.2022.
//

import SwiftUI

struct PurpleButton: View {
    @State private var title: String
    var action:  () -> Void
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        

        Button(action: {
               action()
        }) {
            Text(title)
                .bold()
                .frame(width: 366 , height: 64, alignment: .center)
                //You need to change height & width as per your requirement
        }
         .background(Color.accentColor)
         .foregroundColor(Color.white)
         .cornerRadius(15)
    }
}

struct PurpleButton_Previews: PreviewProvider {
    static var previews: some View {
        PurpleButton(title: "INTRĂ ÎN CONT"){
            
        }
    }
}
