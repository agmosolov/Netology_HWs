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
        let favoritesCoordinator = FavoritesCoordinator()
        let mapCoordinator = MapCoordinator(navigationController: UINavigationController())

        childCoordinators.append(feedCoordinator)
        childCoordinators.append(profileCoordinator)
        childCoordinators.append(favoritesCoordinator)
        childCoordinators.append(mapCoordinator)

        feedCoordinator.start()
        profileCoordinator.start()
        favoritesCoordinator.start()
        mapCoordinator.start()

        tabBarController.viewControllers = [
            feedCoordinator.navigationController,
            profileCoordinator.navigationController,
            favoritesCoordinator.navigationController,
            mapCoordinator.navigationController
        ]
    }
}


