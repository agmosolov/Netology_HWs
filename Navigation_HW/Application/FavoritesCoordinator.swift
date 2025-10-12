//
//  FavoritesCoordinator.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 12.10.2025.
//

import UIKit

class FavoritesCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    let navigationController: UINavigationController

    init() {
        let favoritesViewController = FavoritesViewController()
        favoritesViewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 2)
        navigationController = UINavigationController(rootViewController: favoritesViewController)
    }

    func start() {
    }
}
