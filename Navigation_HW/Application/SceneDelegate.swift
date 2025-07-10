//
//  SceneDelegate.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 05.05.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            
            guard let windowScene = (scene as? UIWindowScene) else { return }
            
            let window = UIWindow(windowScene: windowScene)
            
            let tabBarController = UITabBarController()
            
            let feedViewController = FeedViewController()
            let feedNavigationController = UINavigationController(rootViewController: feedViewController)
            feedNavigationController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "list.bullet"), tag: 0)
            
            let logInViewController = LogInViewController()
            
            let factory = MyLoginFactory()
            logInViewController.loginDelegate = factory.makeLoginInspector()
            
            let profileNavigationController = UINavigationController(rootViewController: logInViewController)
            profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)
            
            tabBarController.viewControllers = [feedNavigationController, profileNavigationController]
            
            window.rootViewController = tabBarController
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    

// Прежняя реализация
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//            
//            guard let windowScene = (scene as? UIWindowScene) else { return }
//            
//            let window = UIWindow(windowScene: windowScene)
//            
//            let tabBarController = UITabBarController()
//            
//            let feedViewController = FeedViewController()
//            
//            let feedNavigationController = UINavigationController(rootViewController: feedViewController)
//            feedNavigationController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "list.bullet"), tag: 0)
//            
//            let logInViewController = LogInViewController()
//            
//            // Установка делегата LoginInspector для LogInViewController
//            logInViewController.loginDelegate = LoginInspector()
//            
//            let profileNavigationController = UINavigationController(rootViewController: logInViewController)
//            profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)
//            
//            tabBarController.viewControllers = [
//                feedNavigationController, profileNavigationController
//            ]
//            
//            window.rootViewController = tabBarController
//            self.window = window
//            window.makeKeyAndVisible()
//        }
//}

