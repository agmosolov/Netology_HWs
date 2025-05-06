//
//  InfoViewController.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 06.05.2025.
//

import UIKit

final class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.title = "ИНФОРМАЦИЯ"
        
        setupUI()
    }
    
    private func setupUI() {
        
        let alertButton = UIButton(type: .system)
        alertButton.setTitle("ПОКАЗАТЬ", for: .normal)
        alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(alertButton)
        
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc func showAlert() {
        
        let alertController = UIAlertController(title: "ВНИМАНИЕ", message: "ВЫБЕРИ ДАЛЬНЕЙШЕЕ ДЕЙСТВИЕ", preferredStyle: .alert)
        
        let actionOne = UIAlertAction(title: "Действие 1", style: .default) { _ in
            self.showMessage("Действие 1 запущено")
        }
        
        let actionTwo = UIAlertAction(title: "Действие 2", style: .default) { _ in
            self.showMessage("Действие 2 запущено")
        }
        
        alertController.addAction(actionOne)
        alertController.addAction(actionTwo)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func showMessage(_ message: String) {
        
        let messageAlert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        messageAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(messageAlert, animated: true, completion: nil)
        
    }
}
