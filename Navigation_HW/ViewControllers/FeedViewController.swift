//
//  FeedViewController.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 06.05.2025.
//

import UIKit

final class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.title = "ЛЕНТА"
        
        setupUI()
    }
    
    
    private func setupUI() {
        
        let postButton = CustomButton(
            title: "ОТКРЫТЬ ПОСТ",
            titleColor: .white,
            backgroundColor: .customBlue)
        { [weak self] in
            self?.openPost()
            }
        
// Старая реализация
//        let postButton = UIButton(type: .system)
//        postButton.setTitle("ОТКРЫТЬ ПОСТ", for: .normal)
//        postButton.addTarget(self, action: #selector(openPost), for: .touchUpInside)
        
        postButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(postButton)
        
        NSLayoutConstraint.activate([
            postButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            postButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        }
    
    
    @objc func openPost() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
    }

}
