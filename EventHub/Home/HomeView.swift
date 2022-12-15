//
//  HomeView.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 28.11.2022.
//

import SwiftUI
import Firebase

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack{
            Color("BackgroundWhite").ignoresSafeArea()
            VStack{
                HomeTopView()
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false){
                    Text("Top 10 evenimente în această săptămână")
                        .font(.system(size: 16))
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            
                            
                            
                            TopEvent()
                            TopEvent()
                            TopEvent()
                            TopEvent()
                        }
                    }.padding(.bottom)
                        .padding(.leading)
                    
                    Text("Evenimente populare 🔥")
                        .font(.system(size: 16))
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            PopularEvents(popularEvents: viewModel.popularEvents)
                 }
                    }.padding(.bottom)
                        .padding(.leading)
                    
                    Text("Evenimente aproape de tine")
                        .font(.system(size: 16))
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            LocationEvents(locationEvents: viewModel.locationEvents)
                        }
                    }.padding(.bottom)
                        .padding(.leading)
                    
                    Text("Eveniment recomandat 🌟")
                        .font(.system(size: 16))
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            
                            RandomEvents(events: viewModel.events)
                            
                        }
                    }.padding(.bottom)
                        .padding(.leading)
                    
                    
                    
                    OrganiseEventButton(){
                        self.viewModel.goToOrganiseEvent()
                    }
                }
                Spacer()
                
            }.ignoresSafeArea()
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(repository: HomeRepository(), navigation: HomeNavigation()))
    }
}
