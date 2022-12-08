//
//  OrganiseEventCoordinator.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 06.12.2022.
//

import UIKit
import SwiftUI

final class OrganiseEventCoordinator{
    let navController : UINavigationController
    
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start(){
        let repository = OrganiseEventRepository()
        var navigation = OrganiseEventNavigation()
        
        
        
        let viewModel = OrganiseEventViewModel(repository: repository, navigation: navigation)
        let view = OrganiseEventView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        navController.navigationBar.isHidden = true
        navController.pushViewController(viewController, animated: true)
        
    }
    
    
    
}
