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
        VStack{
            HomeTopView()
        }
        Spacer()
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(repository: HomeRepository(), navigation: HomeNavigation()))
    }
}
