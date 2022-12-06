//
//  ColoredButton.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 04.12.2022.
//

import SwiftUI

struct ColoredButton: View {
    @State private var title: String
    @State private var color: String
    @State private var width: CGFloat
    
    init(title: String, color: String, width: CGFloat) {
        self.title = title
        self.color = color
        self.width = width
    }
    
    var body: some View {
       
        Button(action: {
            //  action()
        }) {
            Text(title)
                .font(.system(size: 13).bold())
                .frame(width: width, height: 40)
        }.background(Color(color))
            .foregroundColor(Color.white)
            .cornerRadius(35)
        
    }
}

struct ColoredButton_Previews: PreviewProvider {
    static var previews: some View {
        ColoredButton(title: "Astazi", color: "appGray", width: 90)
    }
}
