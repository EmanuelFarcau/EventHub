//
//  DescriptionInput.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 06.12.2022.
//

import SwiftUI

struct DateInput: View {
    
    var title: String
    @Binding var text: Date
    var image: String
    var isTime: Bool
   // var errorMessage: String
    @FocusState var isActive: Bool
    @State private var currentDate = Date()
    
    
    init(_ title: String, isTime: Bool ,text: Binding<Date>,  image: String) {
        self.title = title
        self.isTime = isTime
        self._text = text
        self.image = image
    }
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                ZStack(alignment: .leading){
                    
                    Text(title)
//                        .foregroundColor(!isActive && text.isEmpty ? Color(.placeholderText) : .gray)
//                        .offset(y: !isActive && text.isEmpty ? 0 : -25)
//                        .scaleEffect(!isActive && text.isEmpty ? 1: 0.8, anchor: .leading)
                    if isTime {
                        DatePicker("", selection: $currentDate, displayedComponents: .hourAndMinute).focused($isActive, equals: true)
                    }else {
                        DatePicker("", selection: $currentDate, displayedComponents: .date).focused($isActive, equals: true)
                    }
                   
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
                .frame(width: 366, height: 64)
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


//struct DateInput_Previews: PreviewProvider {
//    static var previews: some View {
//        DateInput()
//    }
//}
