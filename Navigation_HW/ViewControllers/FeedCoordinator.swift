//
//  FeedCoordinator.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 22.07.2025.
//

import UIKit


class FeedCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
        self.navigationController.tabBarItem = UITabBarItem(
            title: "Feed",
            image: UIImage(systemName: "list.bullet"),
            tag: 0
        )
    }
    
    func start() {
        let feedViewController = FeedViewController()
        feedViewController.coordinator = self
        navigationController.pushViewController(feedViewController, animated: true)
    }
    
    func openPost() {
        let postViewController = PostViewController()
        navigationController.pushViewController(postViewController, animated: true)
    }
}
