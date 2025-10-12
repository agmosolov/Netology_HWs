//
//  SceneDelegate.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 05.05.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    var appConfiguration: AppConfiguration?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let configurations: [AppConfiguration] = [
            .people(URL(string: "https://swapi.dev/api/people/8")!),
            .starships(URL(string: "https://swapi.dev/api/starships/3")!),
            .planets(URL(string: "https://swapi.dev/api/planets/5")!)
        ]

        appConfiguration = configurations.randomElement()

        if let configuration = appConfiguration {
            NetworkService.request(for: configuration)
        }

        let window = UIWindow(windowScene: windowScene)
        self.window = window

        let tabBarController = UITabBarController()
        appCoordinator = AppCoordinator(tabBarController: tabBarController)
        appCoordinator?.start()

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
