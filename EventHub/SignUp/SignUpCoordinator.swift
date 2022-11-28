//
//  SignUpCoordinator.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 23.11.2022.
//

import UIKit
import SwiftUI

final class SignUpCoordinator{
    let navController: UINavigationController
    var signInCoordinator: SignInCoordinator?
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start(){
        let repository = SignUpRepository()
        var navigation = SignUpNavigation()
        
//        navigation.onClose = { [weak self] in
//            self?.navController.popViewController(animated: true)
//            print("Should Close SignUpScreen")
//        }
        
        navigation.onGoToSignIn = { [weak self] in
            self?.onGoToSignIn()
        }
        
        let viewModel = SignUpViewModel(repository: repository, navigation: navigation)
        let view = SignUpView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)

        navController.pushViewController(viewController, animated: true)
        
//        signInCoordinator = SignInCoordinator(navController: navController)
//        signInCoordinator?.start()

       
    
    }
    
    func onGoToSignIn(){
        navController.popViewController(animated: true)
    }
}

