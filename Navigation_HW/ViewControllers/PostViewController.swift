//
//  PostViewController.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 06.05.2025.
//

import UIKit
import StorageService

final class PostViewController: UIViewController {
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        changeBackgroundBasedOnScheme()
        
        setupUI()
    }
    
    
    private func changeBackgroundBasedOnScheme() {
#if DEBUG
        view.backgroundColor = .red
#else
        view.backgroundColor = .blue
#endif
    }
    
    
    private func setupUI() {
        
        let infoButton = UIBarButtonItem(title: "ИНФО", style: .plain, target: self, action: #selector(openInfo))
        self.navigationItem.rightBarButtonItem = infoButton
        
    }
    
    @objc func openInfo() {
        
        let infoViewController = InfoViewController()
        
        infoViewController.modalPresentationStyle = .formSheet
        self.present(infoViewController, animated: true, completion: nil)
        
    }
    
    
}
