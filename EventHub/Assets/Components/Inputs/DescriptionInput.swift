//
//  DescriptionInput.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 06.12.2022.
//

import SwiftUI

struct DescriptionInput: View {
    
    var title: String
    @Binding var text: String
    var image: String
   // var errorMessage: String
    @FocusState var isActive: Bool
    
    
    init(_ title: String, text: Binding<String>,  image: String) {
        self.title = title
        self._text = text
        self.image = image
    }
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                ZStack(alignment: .leading){
                    
                    Text(title)
                        .foregroundColor(!isActive && text.isEmpty ? Color(.placeholderText) : .gray)
                        .offset(y: !isActive && text.isEmpty ? 0 : -25)
                        .scaleEffect(!isActive && text.isEmpty ? 1: 0.8, anchor: .leading)
                    TextField("", text: $text).focused($isActive, equals: true).frame(height: 120)
                }
                .padding()
                .onAppear{withAnimation(.easeIn(duration: 0.8))
                    {}
                }
                // .withAnimation(_ animation: Animation? = default)
                VStack{
                    Image(image)
                        .renderingMode(.template).foregroundColor(Color("appGray"))
                }
            }.padding()
                .animation(.default)
                .frame(width: 366, height: 120)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: getLineValue()).foregroundColor(getColorValue()))

            
//            HStack{if !text.isEmpty{
//                Text(errorMessage)
//                    .font(.system(size: 13))
//                    .foregroundColor(Color("errorColor"))
//                    .padding(.leading, 15)
//                    .frame(width: 366, alignment: .leading)
//            }
//                else{
//                    Text("")
//                }
            }
        }
    
    
    
//    func getBackgroundErrorColor() -> Color {
//        if errorMessage == "" || text.isEmpty {return .clear}
//        else{return Color("errorBackground")}
//    }
    
    func getLineValue() -> CGFloat{
        if isActive {return 2}
        else {return 1}
    }
    
    func getColorValue() -> Color {
        if isActive {return Color.accentColor}
        else {return Color.gray}
    }
}


//struct DescriptionInput_Previews: PreviewProvider {
//    static var previews: some View {
//        DescriptionInput()
//    }
//}
