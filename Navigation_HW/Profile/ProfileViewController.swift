//
//  ProfileViewController.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 06.05.2025.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .lightGray
        self.title = "ПРОФИЛЬ"
        
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(profileHeaderView)
        
        NSLayoutConstraint.activate([
                   profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                   profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                   profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                   profileHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
               ])
    }
}
