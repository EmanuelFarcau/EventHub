//
//  SignInCoordinator.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 22.11.2022.
//

import UIKit
import SwiftUI

final class SignInCoordinator{
    let navController: UINavigationController
    var signUpCoordinator: SignUpCoordinator?
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start(){
        let repository = SignInRepository()
        var navigation = SignInNavigation()
        
//        navigation.onClose = { [weak self] in
//            self?.navController.popViewController(animated: true)
//            print("Should Close SignInScreen")
//        }
        
        navigation.onGoToSignUp = { [weak self] in
            self?.onGoToSignUp()
        }
        

        let viewModel = SignInViewModel(repository: repository, navigation: navigation)
        let view = SignInView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        navController.navigationItem.hidesBackButton = true
        

        navController.pushViewController(viewController, animated: true)
        
        
    }
    
    func onGoToSignUp(){
        signUpCoordinator = SignUpCoordinator(navController: navController)
        signUpCoordinator?.start()
    }
}
