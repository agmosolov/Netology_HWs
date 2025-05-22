//
//  LogInViewController.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 20.05.2025.
//

import UIKit


final class LogInViewController: UIViewController {
    
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let imageView = UIImageView()
    private let viewForTF = UIView()
    private let separatorLineForTF = UIView()
    private let logInTF = UITextField()
    private let passwordTF = UITextField()
    private let clearButtonForLogInTF = UIButton(type: .custom)
    private let clearButtonForPasswordTF = UIButton(type: .custom)
    private let logInButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        logInTF.delegate = self
        passwordTF.delegate = self
        
        setupScrollView()
        setupContentView()
        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        
    }
    
    private func setupScrollView() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.backgroundColor = .white
        
        let safeArea = view.safeAreaLayoutGuide
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
        ])
        
    }
    
    private func setupContentView() {
        
        contentView.addSubview(imageView)
        contentView.addSubview(viewForTF)
//        contentView.addSubview(logInButton) Не понимаю почему если добавить кнопку в addSubview contentView кнопка неактвна, как-будто перекрывается другими слоями
        
        view.addSubview(logInButton)
        
        viewForTF.addSubview(logInTF)
        viewForTF.addSubview(separatorLineForTF)
        viewForTF.addSubview(passwordTF)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
    }
    
    private func setupUI() {
        
        imageView.image = UIImage(named: "Logo")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        viewForTF.translatesAutoresizingMaskIntoConstraints = false
        viewForTF.layer.masksToBounds = true
        viewForTF.layer.borderWidth = 0.5
        viewForTF.layer.cornerRadius = 10
        viewForTF.layer.borderColor = UIColor.lightGray.cgColor
        viewForTF.backgroundColor = UIColor.systemGray6
        
        

        
        logInTF.translatesAutoresizingMaskIntoConstraints = false
        logInTF.placeholder = "Enter your login or phone number"
        logInTF.font?.withSize(16)
        logInTF.tintColor = UIColor(named: "accentColor")
        logInTF.autocapitalizationType = .none
        setupTFLeftPaddingForLogInTF()
        

        separatorLineForTF.translatesAutoresizingMaskIntoConstraints = false
        separatorLineForTF.backgroundColor = UIColor.lightGray
        
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.isSecureTextEntry = true
        passwordTF.placeholder = "Enter your password"
        passwordTF.font?.withSize(16)
        setupTFLeftPaddingForPasswordTF()


        
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.backgroundColor = .customBlue
        logInButton.layer.cornerRadius = 10
        logInButton.setTitle("LOG IN", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        logInButton.addTarget(self, action: #selector(buttonStateChanged), for: .allTouchEvents)
        logInButton.addTarget(self, action: #selector(buttonStateChanged), for: .valueChanged)
        updateButtonAlpha()
        
        
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            
            viewForTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewForTF.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            viewForTF.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewForTF.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 120),
            viewForTF.heightAnchor.constraint(equalToConstant: 100),
            
            logInTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInTF.leadingAnchor.constraint(equalTo: viewForTF.leadingAnchor),
            logInTF.trailingAnchor.constraint(equalTo: viewForTF.trailingAnchor),
            logInTF.topAnchor.constraint(equalTo: viewForTF.topAnchor),
            logInTF.heightAnchor.constraint(equalToConstant: 49.8),
            
            separatorLineForTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            separatorLineForTF.leadingAnchor.constraint(equalTo: viewForTF.leadingAnchor),
            separatorLineForTF.trailingAnchor.constraint(equalTo: viewForTF.trailingAnchor),
            separatorLineForTF.topAnchor.constraint(equalTo: logInTF.bottomAnchor),
            separatorLineForTF.heightAnchor.constraint(equalToConstant: 0.4),
            
            
            passwordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTF.leadingAnchor.constraint(equalTo: viewForTF.leadingAnchor),
            passwordTF.trailingAnchor.constraint(equalTo: viewForTF.trailingAnchor),
            passwordTF.topAnchor.constraint(equalTo: separatorLineForTF.bottomAnchor),
            passwordTF.heightAnchor.constraint(equalToConstant: 49.8),
            
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.topAnchor.constraint(equalTo: viewForTF.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50)
        ])
        
    }

    
    @objc func logInButtonTapped() {
        let profileVC = ProfileViewController()
            navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @objc private func buttonStateChanged() {
        updateButtonAlpha()
    }
    
    
    @objc private func clearLogInTF() {
        logInTF.text = ""
    }
    
    @objc private func clearPasswordTF() {
        passwordTF.text = ""
    }

    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
            
            var viewFrame = self.view.frame
            viewFrame.size.height -= keyboardSize.height
            
            if let activeField = viewForTF.subviews.first(where: { $0.isFirstResponder }) {
                if !viewFrame.contains(activeField.frame.origin) {
                    scrollView.scrollRectToVisible(activeField.frame, animated: true)
                }
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func updateButtonAlpha() {
        if logInButton.isSelected || logInButton.isHighlighted || !logInButton.isEnabled {
            logInButton.alpha = 0.8
        } else {
            logInButton.alpha = 1.0
        }
    }
    
    private func setupTFLeftPaddingForLogInTF() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: logInTF.frame.height))
        logInTF.leftView = paddingView
        logInTF.leftViewMode = .always
    }
    
    private func setupTFLeftPaddingForPasswordTF() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTF.frame.height))
        passwordTF.leftView = paddingView
        passwordTF.leftViewMode = .always
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
