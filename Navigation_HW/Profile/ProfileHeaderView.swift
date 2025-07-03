//
//  ProfileHeaderView.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 12.05.2025.
//

import UIKit
import SnapKit


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
        
        setupLayout()
    }
    
    
    private func setupLayout() {
        avatarView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(safeAreaLayoutGuide).offset(16)
            make.width.height.equalTo(100)
        }
        
        nickNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(avatarView.snp.trailing).offset(16)
            make.top.equalTo(safeAreaLayoutGuide).offset(27)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.leading.equalTo(nickNameLabel)
            make.bottom.equalTo(statusTextField.snp.top).offset(-10)
            make.trailing.equalTo(nickNameLabel)
        }
        
        statusTextField.snp.makeConstraints { make in
            make.leading.equalTo(nickNameLabel)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
        
        changeStatusButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(statusTextField.snp.bottom).offset(10)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-10)
            make.height.equalTo(50)
        }
    }
    
    @objc func changeStatus() {
          if let newStatus = statusTextField.text, !newStatus.isEmpty {
              statusLabel.text = newStatus
          }
      }
}
