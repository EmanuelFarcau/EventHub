//
//  ContentView.swift
//  EventHub
//
//  Created by internship on 18.11.2022.
//

import SwiftUI

struct SignInView<ViewModel: SignInViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    @State private var email = ""
    @State private var password = ""
  
    

    var body: some View {
            VStack {
                VStack{
                    Image("imageEventHub")
                        .padding(.bottom, 15)
                        //.padding(.top, 1)
                        .padding()
                }
                
                VStack{
                    Text("Autentifică-te")
                        .font(.system(size: 24).bold())
                        .frame(width: 366, height: 32, alignment:.topLeading)
                }
                VStack{
                    TextInput("Adresa de e-mail",isSecured: false,text: $email, image: "email", errorMessage: "" )
                   
                    TextInput("Parola",isSecured: true ,text: $password, image: "passwordIcon", errorMessage: "")
                 
                    PurpleButton(title: "INTRĂ ÎN CONT")
                }
               
                    
                Text("SAU")
                    .foregroundColor(Color("appGray"))
                    .font(.system(size: 16).bold())
                    .padding()
                HStack{
                    Text("Nu ai cont?")
                        .font(.system(size: 16))
                    TextButton(title: "Înregistrează-te"){
                        self.viewModel.goToSignUp()
                    }
                    
                }
                Spacer()
            }
            .padding()
        
        
        
        
    }
    
    
}




struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: SignInViewModel(repository: SignInRepository(), navigation: SignInNavigation()))
    }
}
