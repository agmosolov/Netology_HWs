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

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let mapViewController = MapViewController()
        mapViewController.title = "Map"
        navigationController.pushViewController(mapViewController, animated: false)
    }
}
