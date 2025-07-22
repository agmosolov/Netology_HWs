//
//  AppCoordinator.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 22.07.2025.
//

import UIKit


class AppCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    let tabBarController: UITabBarController

    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }

    func start() {
        let feedCoordinator = FeedCoordinator()
        let profileCoordinator = ProfileCoordinator()

        childCoordinators.append(feedCoordinator)
        childCoordinators.append(profileCoordinator)

        feedCoordinator.start()
        profileCoordinator.start()

        tabBarController.viewControllers = [
            feedCoordinator.navigationController,
            profileCoordinator.navigationController
        ]
    }
}


