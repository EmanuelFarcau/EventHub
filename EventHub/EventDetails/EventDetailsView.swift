//
//  EventDetailsView.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 08.12.2022.
//

import SwiftUI

struct EventDetailsView<ViewModel: EventDetailsViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    
    var body: some View {
        ZStack{
            Color("BackgroundWhite").ignoresSafeArea()
            
            VStack(alignment: .leading){
                ZStack{
                    DetailsTopView()
                }
                
                PurpleButton(title: "VREAU SĂ PARTICIP", icon: "Star"){
                    //
                }
                .padding()
                

                
                Image("Line")
                    .padding()
                
                ScrollView(.vertical, showsIndicators: false){
                    Section{
                        HStack{
                            Image ("PurpleCalendar")
                                .frame(width: 56, height: 56)
                                .padding(.bottom, 40)
                            VStack(alignment: .leading){
                                Text("Data 6 Octombrie 2023")
                                    .font(.system(size: 16).bold())
                                Text("Ora 17:00")
                                    .font(.system(size: 16))
                                    .padding(.bottom, 6)
                                ActionPurpleButton(icon: "calendar", title: "Adaugă în calendar", width: 200){}
                            }
                            .padding(.leading)
                        }
                    }.padding(.leading, -50)
                        .padding(.bottom)
                    
                    Section{
                        HStack{
                            Image ("PurpleLocation")
                                .frame(width: 56, height: 56)
                                .padding(.bottom, 40)
                            VStack(alignment: .leading){
                                Text("Data 6 Octombrie 2023")
                                    .font(.system(size: 16).bold())
                                Text("Ora 17:00")
                                    .font(.system(size: 16))
                                    .padding(.bottom, 6)
                                ActionPurpleButton(icon: "location", title: "Vezi locatia pe harta", width: 200){}
                            }
                            .padding(.leading)
                        }
                    }.padding(.leading, -50)
                        .padding(.bottom)
                    
                    Section{
                        HStack{
                            Image ("PurpleTicket")
                                .frame(width: 56, height: 56)
                                .padding(.bottom, 40)
                            VStack(alignment: .leading){
                                Text("Cumpara Bilet")
                                    .font(.system(size: 16).bold())
                                Text("Link Link Link")
                                    .font(.system(size: 16))
                                    .padding(.bottom, 6)
                                ActionPurpleButton(icon: "Ticket", title: "Cumpără bilete", width: 200){}
                            }
                            .padding(.leading)
                        }
                    }.padding(.leading, -50)
                        .padding(.bottom)
                    
                    Image("Line")
                        .padding()
                    
                    HStack{
                        Image("DjProfile")
                            .padding(.leading, 20)
                        VStack(alignment: .leading){
                            Text("Username")
                                .font(.system(size: 16).bold())
                            Text("Organizator")
                        }.padding(.leading)
                        Spacer()
                        NextButton(){}
                            .padding(.trailing, 20)
                    }
                }
                
               
                
                Spacer()
            }.ignoresSafeArea()
        }
    }
}

struct EventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailsView(viewModel: EventDetailsViewModel(repository: EventDetailsRepository(), navigation: EventDetailsNavigation()))
    }
}
