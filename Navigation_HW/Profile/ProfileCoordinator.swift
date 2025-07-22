//
//  ProfileCoordinator.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 22.07.2025.
//

import UIKit


class ProfileCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    let navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
        self.navigationController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.circle"),
            tag: 1
        )
    }
    
    func start() {
        let logInViewController = LogInViewController()
        logInViewController.coordinator = self
        navigationController.pushViewController(logInViewController, animated: true)
    }
    
    func showProfile(for user: User) {
        let profileViewController = ProfileViewController()
        profileViewController.user = user
        navigationController.pushViewController(profileViewController, animated: true)
    }
}
