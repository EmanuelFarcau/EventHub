//
//  EventDetailsCoordinator.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 08.12.2022.
//

import SwiftUI
import UIKit

final class EventDetailsCoordinator {
    let navController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start(){
        let repository = EventDetailsRepository()
        var navigation = EventDetailsNavigation()
        
        navigation.onGoToHome = { [weak self] in
            self?.onGoToHome()
        }
        
     
        let viewModel = EventDetailsViewModel(repository: repository, navigation: navigation)
        let view = EventDetailsView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        navController.navigationBar.isHidden = true
        navController.pushViewController(viewController, animated: true)
        
    }
    
    func onGoToHome(){
        navController.popViewController(animated: true)
    }
    
}

