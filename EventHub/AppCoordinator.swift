//
//  AppCoordinator.swift
//  EventHub
//
//  Created by Raul Emanuel Farcau on 22.11.2022.
//

import UIKit

final class AppCoordinator{
    let window: UIWindow
    let navController: UINavigationController
    var signInCoordinator: SignInCoordinator?
    
    
    init(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        navController = UINavigationController()
        
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
    
    func start(){
        let isLogged = false
        
        if isLogged{
            print("show dashboard")
        } else {
            signInCoordinator = SignInCoordinator(navController: navController)
            signInCoordinator?.start()
        }
    }
    
}

