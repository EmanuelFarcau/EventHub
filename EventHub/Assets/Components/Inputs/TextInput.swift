//
//  TextInput.swift
//  EventHub
//
//  Created by internship on 21.11.2022.
//

import SwiftUI

struct TextInput: View {
    
    var title: String
    @Binding var text: String
    var image: String
    @FocusState var isActive: Bool
    
    
    init(_ title: String, text: Binding<String>, _ image: String) {
        self.title = title
        self._text = text
        self.image = image
    }
    
    var body: some View {
        HStack{
            ZStack(alignment: .leading){
                Text(title)
                    .foregroundColor(!isActive ? Color(.placeholderText) : .gray)
                    .offset(y: !isActive ? 0 : -25)
                    .scaleEffect(!isActive ? 1: 0.8, anchor: .leading)
                TextField("", text: $text).focused($isActive, equals: true)
            }
                    .padding()
                    .onAppear{withAnimation(.easeIn(duration: 0.8))
                        {}
                    }
                   // .withAnimation(_ animation: Animation? = default)
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
    
    //struct TextInputField: View{
    //
    //
    //
    //    var title: String
    //    @Binding var text: String
    //    var image: String
    //
    //    init(_ title: String, text: Binding<String>, _ image: String) {
    //        self.title = title
    //        self._text = text
    //        self.image = image
    //    }
    //
    //        var body: some View {
    //            HStack{
    //                ZStack(alignment: .leading){
    //                    Text(title)
    //                        .foregroundColor(text.isEmpty ? Color(.placeholderText) : .gray)
    //                        .offset(y: text.isEmpty ? 0 : -25)
    //                        .scaleEffect(text.isEmpty ? 1: 0.8, anchor: .leading)
    //                    TextField("", text: $text)
    //                }.padding()
    //                    .onAppear{withAnimation(.easeIn(duration: 0.8))
    //                        {}
    //                    }
    //               // .animation(.default)
    //                VStack{
    //                    Image(image)
    //                        .renderingMode(.template).foregroundColor(.gray)
    //                }
    //        }.padding()
    //                .frame(width: 366, height: 64  )
    //                .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1).foregroundColor(Color.gray))
    //
    //    }
    //
    //
    //}
    
    
    //
    //struct TextInput_Previews: PreviewProvider {
    //    @State private var email = ""
    //
    //    static var previews: some View {
    //    //    TextInput("titlu", text: $email,"image")
    //    }
    //}

