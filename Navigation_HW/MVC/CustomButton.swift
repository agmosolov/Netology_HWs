//
//  CustomButton.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 21.07.2025.
//

import UIKit

class CustomButton: UIButton {
    
    private var action: (()->Void)?
    
    init(title: String, 
         titleColor: UIColor,
         backgroundColor: UIColor,
         action: (()->Void)?) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.action = action
        
        self.layer.cornerRadius = 10
        
        self.contentEdgeInsets = UIEdgeInsets(
            top: 8,
            left: 16,
            bottom: 8,
            right: 16
        )
        
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        action?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
