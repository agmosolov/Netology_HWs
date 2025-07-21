//
//  LogInHeaderView.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 26.05.2025.
//

import UIKit


final class LogInHeaderView: UIView {
    
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Logo")
        return imageView
    }()
    
    
    let viewForTF: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.backgroundColor = UIColor.systemGray6
        return view
    }()
    
    
    let logInTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Enter your login or phone number"
        tf.font?.withSize(16)
        tf.tintColor = UIColor(named: "accentColor")
        tf.autocapitalizationType = .none
        tf.text = "AAA"
        return tf
    }()
    
    
    private let separatorLineForTF: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    
    let passwordTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.placeholder = "Enter your password"
        tf.font?.withSize(16)
        tf.text = "123"
        return tf
    }()

    
    lazy var logInButton: CustomButton = {
        let button = CustomButton(
            title: "LOG IN",
            titleColor: .white,
            backgroundColor: .customBlue
        ) { [weak self] in
            self?.updateButtonAlpha()
            }
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
// Старая реализация
//    let logInButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .customBlue
//        button.layer.cornerRadius = 10
//        button.setTitle("LOG IN", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        return button
//        
//    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    
    private func setupViews() {
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(imageView)
        contentView.addSubview(viewForTF)
        contentView.addSubview(logInButton)
        
        viewForTF.addSubview(logInTF)
        viewForTF.addSubview(separatorLineForTF)
        viewForTF.addSubview(passwordTF)
        
//        logInButton.addTarget(self, action: #selector(buttonStateChanged), for: .allTouchEvents)
//        logInButton.addTarget(self, action: #selector(buttonStateChanged), for: .valueChanged)
        
        setupLayuot()
        setupTextFieldPadding()
    }
    
    
    private func setupLayuot() {
        
        let safeArea = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
 
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
    
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            
            viewForTF.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewForTF.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            viewForTF.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewForTF.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 120),
            viewForTF.heightAnchor.constraint(equalToConstant: 100),
            
            logInTF.centerXAnchor.constraint(equalTo: centerXAnchor),
            logInTF.leadingAnchor.constraint(equalTo: viewForTF.leadingAnchor),
            logInTF.trailingAnchor.constraint(equalTo: viewForTF.trailingAnchor),
            logInTF.topAnchor.constraint(equalTo: viewForTF.topAnchor),
            logInTF.heightAnchor.constraint(equalToConstant: 49.8),
            
            separatorLineForTF.centerXAnchor.constraint(equalTo: centerXAnchor),
            separatorLineForTF.leadingAnchor.constraint(equalTo: viewForTF.leadingAnchor),
            separatorLineForTF.trailingAnchor.constraint(equalTo: viewForTF.trailingAnchor),
            separatorLineForTF.topAnchor.constraint(equalTo: logInTF.bottomAnchor),
            separatorLineForTF.heightAnchor.constraint(equalToConstant: 0.4),
            
            passwordTF.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTF.leadingAnchor.constraint(equalTo: viewForTF.leadingAnchor),
            passwordTF.trailingAnchor.constraint(equalTo: viewForTF.trailingAnchor),
            passwordTF.topAnchor.constraint(equalTo: separatorLineForTF.bottomAnchor),
            passwordTF.heightAnchor.constraint(equalToConstant: 49.8),
            
            logInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.topAnchor.constraint(equalTo: viewForTF.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])
    }
    
    

//    @objc private func buttonStateChanged() {
//        updateButtonAlpha()
//    }
    
    
    @objc private func clearLogInTF() {
        logInTF.text = ""
    }
    
    @objc private func clearPasswordTF() {
        passwordTF.text = ""
    }
    
    private func updateButtonAlpha() {
            if logInButton.isSelected || logInButton.isHighlighted || !logInButton.isEnabled {
                logInButton.alpha = 0.8
            } else {
                logInButton.alpha = 1.0
            }
        }
    
    private func setupTextFieldPadding() {
        let paddingWidth: CGFloat = 10.0

        let loginPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingWidth, height: logInTF.frame.height))
        logInTF.leftView = loginPaddingView
        logInTF.leftViewMode = .always

        let passwordPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: paddingWidth, height: passwordTF.frame.height))
        passwordTF.leftView = passwordPaddingView
        passwordTF.leftViewMode = .always
    }
}



