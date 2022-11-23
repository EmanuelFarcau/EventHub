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
    
    
    init(scene: UIWindowScene) {
        window = UIWindow(windowScene: scene)
        self.navController = UINavigationController()
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
    
    
}

