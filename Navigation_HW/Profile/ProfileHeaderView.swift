//
//  ProfileHeaderView.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 12.05.2025.
//

import UIKit


final class ProfileHeaderView: UIView {
    
    private let avatarView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Avatar")
        return view
    }()
    
    
    private let nickNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sasha 295"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Do nothing"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let changeStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Set Status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let statusTextField: UITextField = {
        let textField = UITextField()
//        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter new status"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.backgroundColor = UIColor.white
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(avatarView)
        addSubview(nickNameLabel)
        addSubview(statusLabel)
        addSubview(changeStatusButton)
        addSubview(statusTextField)
        
        changeStatusButton.addTarget(self, action: #selector(changeStatus), for: .touchUpInside)
        
        setupLayuot()
    }
    
    
    private func setupLayuot() {
        
        NSLayoutConstraint.activate([
            
            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarView.widthAnchor.constraint(equalToConstant: 100),
            avatarView.heightAnchor.constraint(equalToConstant: 100),
            
            nickNameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 16),
            nickNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            nickNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            statusLabel.leadingAnchor.constraint(equalTo: nickNameLabel.leadingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -10),
            statusLabel.trailingAnchor.constraint(equalTo: nickNameLabel.trailingAnchor),
            
            statusTextField.leadingAnchor.constraint(equalTo: nickNameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            changeStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            changeStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            changeStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 10),
            changeStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            changeStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    
    @objc func changeStatus() {
        if let newStatus = statusTextField.text, !newStatus.isEmpty {
            statusLabel.text = newStatus
        }
    }
    
    
}
