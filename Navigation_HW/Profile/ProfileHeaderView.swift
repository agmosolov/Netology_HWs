//
//  ProfileHeaderView.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 12.05.2025.
//

import UIKit


final class ProfileHeaderView: UIView {
    
    private let avatarView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
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
        label.text = "do something...."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let showStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        addSubview(showStatusButton )
        
        NSLayoutConstraint.activate([
            
            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarView.widthAnchor.constraint(equalToConstant: 100),
            avatarView.heightAnchor.constraint(equalToConstant: 100),
            
            nickNameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 16),
            nickNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            nickNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            statusLabel.leadingAnchor.constraint(equalTo: nickNameLabel.leadingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -34),
            statusLabel.trailingAnchor.constraint(equalTo: nickNameLabel.trailingAnchor),
            
            showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            showStatusButton.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
