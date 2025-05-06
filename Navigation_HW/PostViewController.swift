//
//  PostViewController.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 06.05.2025.
//

import UIKit

class PostViewController: UIViewController {
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        if let post = post {
            self.title = post.title
        }
         
    }
}
