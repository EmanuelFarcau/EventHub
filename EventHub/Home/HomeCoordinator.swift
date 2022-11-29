//
//  HomeCoordinator.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 28.11.2022.
//

import UIKit
import SwiftUI


final class HomeCoordinator {
    let navController : UINavigationController
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start(){
        let repository = HomeRepository()
        var navigation = HomeRepository()
        
        
        let viewModel = HomeViewModel(repository: repository, navigation: navigation as! HomeNavigationProtocol)
        let view = HomeView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        
    }
}
