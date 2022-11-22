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
                .padding(.bottom, 15)
                //.padding(.top, 1)
                .padding()
            Text("Autentifică-te")
                .font(.system(size: 24).bold())
                .padding()
            
           
                TextInput("Adresa de e-mail",text: $email, "email")
                .padding(.bottom)
                PasswordInput("Parola", text: $password, "passwordIcon")
                .padding(.bottom)
                PurpleButton(title: "INTRĂ ÎN CONT")
                
            
            Spacer()
        }
        .padding()
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
