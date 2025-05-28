//
//  LogInViewController.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 20.05.2025.
//

import UIKit


final class LogInViewController: UIViewController {
    
    private let logInHeaderView = LogInHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        
        logInHeaderView.translatesAutoresizingMaskIntoConstraints = false
        logInHeaderView.logInTF.delegate = self
        logInHeaderView.passwordTF.delegate = self
        
        
        self.view.addSubview(logInHeaderView)
        setupLayout()
        
        
        logInHeaderView.logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            logInHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logInHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logInHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logInHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
    }
    
    @objc func logInButtonTapped() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            logInHeaderView.scrollView.contentInset = contentInsets
            logInHeaderView.scrollView.scrollIndicatorInsets = contentInsets
            
            var viewFrame = self.view.frame
            viewFrame.size.height -= keyboardSize.height
            
            if let activeField = logInHeaderView.viewForTF.subviews.first(where: { $0.isFirstResponder }) {
                if !viewFrame.contains(activeField.frame.origin) {
                    logInHeaderView.scrollView.scrollRectToVisible(activeField.frame, animated: true)
                }
            }
        }
    }
    
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        logInHeaderView.scrollView.contentInset = contentInsets
        logInHeaderView.scrollView.scrollIndicatorInsets = contentInsets
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}


extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
