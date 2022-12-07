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
    var organiseEventCoordinator: OrganiseEventCoordinator?
    
   

    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start(){
        let repository = HomeRepository()
        var navigation = HomeNavigation()
        
        navigation.onGoToOrganiseEvent = { [weak self] in
            self?.onGoToOrganiseEvent()
        }
        
        
        let viewModel = HomeViewModel(repository: repository, navigation: navigation)
        let view = HomeView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        navController.navigationBar.isHidden = true
        navController.pushViewController(viewController, animated: true)
        
    }
    
    func onGoToOrganiseEvent() {
        organiseEventCoordinator = OrganiseEventCoordinator(navController: navController)
        organiseEventCoordinator?.start()
    }
}

