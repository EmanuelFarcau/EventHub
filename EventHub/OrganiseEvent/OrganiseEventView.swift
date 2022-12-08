//
//  OrganiseEventView.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 06.12.2022.
//

import SwiftUI
import PhotosUI

struct OrganiseEventView<ViewModel: OrganiseEventViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel

    
    var body: some View {
        ZStack{
            Color("BackgroundWhite").ignoresSafeArea()
            VStack{
                
                HStack{
                    BackButton(){
                        self.viewModel.goToHome()
                    }
                        .padding(.leading)
                    Text("Evenimentul tău")
                        .font(.system(size: 24).bold())
                        .padding(.leading, 50)
                    Spacer()
                        
                } .padding(.top, 80)
               
                
                
                PhotoPicker(image: $viewModel.image)
                    .padding(.bottom)
                
                TextInput("Nume eveniment",isSecured: false,text: $viewModel.name, image: "pencil", errorMessage: "" )
                
                DateInput("Dată eveniment", isTime: false,text: $viewModel.date, image: "calendar" )
                    .padding(.bottom, 5)
                DateInput("Oră eveniment", isTime: true,text: $viewModel.date, image: "clock" )
                    .padding(.bottom, 5)
                TextInput("Locație eveniment",isSecured: false,text: $viewModel.location, image: "location", errorMessage: "" ).disabled(true)
                DescriptionInput("Descriere eveniment", text: $viewModel.description, image: "description")
                
                PurpleButton(title: "CREEAZĂ EVENIMENT"){
                    //
                }
                
                Spacer()
            }.ignoresSafeArea()
           
        }
    }
}

struct OrganiseEventView_Previews: PreviewProvider {
    static var previews: some View {
        OrganiseEventView(viewModel: OrganiseEventViewModel(repository: OrganiseEventRepository(), navigation: OrganiseEventNavigation()) )
    }
}
