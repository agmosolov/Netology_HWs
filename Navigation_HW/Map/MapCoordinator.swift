//
//  MapCoordinator.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 29.10.2025.
//

import UIKit

class MapCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    let navigationController: UINavigationController

    init() {
        let mapViewController = MapViewController()
        mapViewController.title = "Карта"
        
        mapViewController.tabBarItem = UITabBarItem(title: "Карта", image: UIImage(systemName: "map.fill"), tag: 3)
        navigationController = UINavigationController(rootViewController: mapViewController)
    }

    func start() {
    }
}
