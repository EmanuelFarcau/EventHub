//
//  ContentView.swift
//  EventHub
//
//  Created by internship on 18.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    

    var body: some View {
        VStack(alignment: .leading) {
            Image("imageEventHub")
                .padding(.bottom, 30)
                .padding(.top, 30)
                .padding()
            Text("Autentifică-te")
                .font(.system(size: 24))
                .padding()
            
            HStack{
                TextInputField("Adresa de e-mail",text: $email)
                    .padding()
                    
                VStack{
                    Image("email")
                        .renderingMode(.template).foregroundColor(.gray )
                    
                }
            }
                .padding()
                .frame(width: 366, height: 64  )
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1).foregroundColor(Color.gray))
                
            
                
            
            Spacer()
        }
        .padding()
    }
}


struct TextInputField: View{
    var title: String
    @Binding var text: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .leading){
            Text(title)
                .foregroundColor(text.isEmpty ? Color(.placeholderText) : .gray)
                .offset(y: text.isEmpty ? 0 : -25)
                .scaleEffect(text.isEmpty ? 1: 0.8, anchor: .leading)
            TextField("", text: $text)
        }.padding()
            .onAppear{withAnimation(.easeIn(duration: 0.8))
                {}
            }
           // .animation(.default)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
