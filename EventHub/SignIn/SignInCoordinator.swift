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
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start(){
        let repository = SignInRepository()
        var navigation = SignInNavigation()
        var signUpNavigation = SignUpNavigation()
        
        navigation.onClose = { [weak self] in
            self?.navController.popViewController(animated: true)
            print("Should Close SignInScreen")
        }
        

        let viewModel = SignInViewModel(repository: repository, navigation: navigation)
        let view = SignInView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)

        navController.pushViewController(viewController, animated: true)
        
        signUpNavigation.onGoToSignIn = { [weak self] in
            
            self?.navController.pushViewController(viewController, animated: true)
            //should open the sign in screen xD
        }
    }
    
//    func start2(){
//        let repository = SignInRepository()
//        var navigation = SignInNavigation()
//
//        navigation.onClose = { [weak self] in
//            //start new flow
//
//        }
//
//        navigation.onGoToSignUp
//
//        let viewModel = SignInViewModel(repository: repository, navigation: navigation)
//        let view = SignInView(viewModel: viewModel)
//        let viewController = UIHostingController(rootView: view)
//
//        navController.pushViewController(viewController, animated: true)
//    }
}
