//
//  Coordinator.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 22.07.2025.
//


protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }
    func start()
    
}
