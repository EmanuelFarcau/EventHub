//
//  NumberInput.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 12.12.2022.
//

import SwiftUI
import Combine

class NumbersOnly: ObservableObject{
    @Published var value = "" {
        didSet{
            let filtered = value.filter{ $0.isNumber }
            if value != filtered{
                value = filtered
            }
        }
    }
}

struct NumberInput: View {
    
    var title: String
    @Binding var text: String
    var image: String
    var errorMessage: String
    @FocusState var isActive: Bool
    
    init(title: String, text: Binding<String>, image: String, errorMessage: String) {
        self.title = title
        self._text = text
        self.image = image
        self.errorMessage = errorMessage
    }
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                ZStack(alignment: .leading){
                    
                    Text(title)
                        .foregroundColor(!isActive && text.isEmpty ? Color(.placeholderText) : .gray)
                        .offset(y: !isActive && text.isEmpty ? 0 : -25)
                        .scaleEffect(!isActive && text.isEmpty ? 1: 0.8, anchor: .leading)
                    TextField("", text: $text).focused($isActive, equals: true)
                        .keyboardType(.decimalPad)
                        .onReceive(Just(text)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.text = filtered
                                        }
                                    }
                }
                .padding()
                .onAppear{withAnimation(.easeIn(duration: 0.8))
                    {}
                }
                // .withAnimation(_ animation: Animation? = default)
                VStack{
                    Image(image)
                        .renderingMode(.template).foregroundColor(getImageColor())
                }
            }.padding()
                .animation(.default)
                .frame(width: 366, height: 64)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: getLineValue()).foregroundColor(getColorValue()))
                .background(getBackgroundErrorColor()).cornerRadius(15)
            
            
            HStack{if !text.isEmpty{
                Text(errorMessage)
                    .font(.system(size: 13))
                    .foregroundColor(Color("errorColor"))
                    .padding(.leading, 15)
                    .frame(width: 366, alignment: .leading)
            }
                else{
                    Text("")
                }
            }
        }
    }
    
    func getImageColor() -> Color {
        if errorMessage == "" || text.isEmpty {return Color("appGray") }
        else{return Color("errorColor")}
    }
    
    func getBackgroundErrorColor() -> Color {
        if errorMessage == "" || text.isEmpty {return .clear}
        else{return Color("errorBackground")}
    }
    
    func getLineValue() -> CGFloat{
        if isActive {return 2}
        else {return 1}
    }
    
    func getColorValue() -> Color {
        if isActive && !(errorMessage != "" && !text.isEmpty){return Color.accentColor}
        else if errorMessage != "" && !text.isEmpty {return Color("errorColor")}
        else {return Color.gray}
    }
}
