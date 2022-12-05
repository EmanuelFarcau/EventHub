//
//  SignUpView.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 23.11.2022.
//

import SwiftUI
import Firebase

struct SignUpView<ViewModel: SignUpViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    //@State var errorMessage: String
  
    var body: some View {
        VStack(alignment: .leading){
            Text("Înregistrează-te")
                .font(.system(size: 24).bold())
                .padding()
            
            TextInput("Numele și Prenumele",isSecured: false,text: $viewModel.username,image: "username",errorMessage: "")
        
            TextInput("Adresa de e-mail", isSecured: false,text: $viewModel.email, image: "email", errorMessage: viewModel.emailPrompt )
            
            TextInput("Parola",isSecured: true ,text: $viewModel.password, image: "passwordIcon", errorMessage: viewModel.passwordPrompt)
             
            TextInput("Confirmă parola",isSecured: true ,text: $viewModel.confirmPassword, image: "passwordIcon", errorMessage: viewModel.confirmPwPrompt)
           
            PurpleButton(title: "CREEAZĂ CONT"){
                self.viewModel.signUp()
            }
            .opacity(viewModel.isSignUpComplete ? 1 : 0.6)
            .disabled(!viewModel.isSignUpComplete)
            .alert(viewModel.errorMessage, isPresented: $viewModel.isError){
                Button("Ok", role: .cancel){}
            }
            Text("SAU")
                .foregroundColor(Color("appGray"))
                .font(.system(size: 16).bold())
                .padding()
                .frame(width: 366, height: 64, alignment:.center)
            HStack{
                Text("Ai deja cont?")
                    .font(.system(size: 16))
                TextButton(title: "Autentifică-te") {
                    self.viewModel.onGoToSignIn()
                }
            }.frame(width: 366, alignment:.center)
            Spacer()
        }
    }
    
    
//    func signUp(){
//
//    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel(repository: SignUpRepository(), navigation: SignUpNavigation()))
    }
}
