//
//  PasswordInput.swift
//  EventHub
//
//  Created by internship on 21.11.2022.
//

import SwiftUI

struct PasswordInput: View {
    var password: String
    @Binding var text: String
    var image: String
    @FocusState var isActive: Bool

    
    init(_ password: String, text: Binding<String>, _ image: String) {
        self.password = password
        self._text = text
        self.image = image
    }
    
        var body: some View {
            HStack{
                ZStack(alignment: .leading){
                    Text(password)
                        .foregroundColor(!isActive ? Color(.placeholderText) : .gray)
                        .offset(y: !isActive ? 0 : -25)
                        .scaleEffect(!isActive ? 1: 0.8, anchor: .leading)
                    SecureField("", text: $text).focused($isActive, equals: true)
                }.padding()
                    .onAppear{withAnimation(.easeIn(duration: 1.2))
                        {}
                    }
               // .animation(.default)
                VStack{
                    Image(image)
                        .renderingMode(.template).foregroundColor(.gray)
                }
        }.padding()
                .animation(.default)
                .frame(width: 366, height: 64  )
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: getLineValue()).foregroundColor(getColorValue()))
        
    }
    
    func getLineValue() -> CGFloat{
        if isActive {return 2}
        else {return 1}
    }
    
    func getColorValue() -> Color {
        if isActive {return Color.accentColor}
        else {return Color.gray}
    }
}

//struct PasswordInput_Previews: PreviewProvider {
//    static var previews: some View {
//        PasswordInput("Parola", text: $password, "email" )
//    }
//}
