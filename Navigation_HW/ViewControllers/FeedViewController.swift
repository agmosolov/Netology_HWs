//
//  FeedViewController.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 06.05.2025.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private let viewModel = FeedViewModel()
    private let statusLabel = UILabel()
    private let guessTextField = UITextField()
    
    weak var coordinator: FeedCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "ЛЕНТА"
        setupUI()
        bindViewModel()
    }
    
    
    private func setupUI() {
        
        let postButton = CustomButton(
            title: "Открыть пост",
            titleColor: .white,
            backgroundColor: .customBlue)
        { [weak self] in
            self?.openPost()
        }
        self.view.addSubview(postButton)
        
        guessTextField.borderStyle = .roundedRect
        guessTextField.placeholder = "Кодовое слово"
        guessTextField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(guessTextField)
        
        let checkGuessButton = CustomButton(
            title: "Проверить",
            titleColor: .white,
            backgroundColor: .customBlue
        ) { [weak self] in
            self?.viewModel.checkGuess(word: self?.guessTextField.text)
        }
        self.view.addSubview(checkGuessButton)
        
        statusLabel.text = "Введите кодовое слово"
        statusLabel.textAlignment = .center
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(statusLabel)
        
        NSLayoutConstraint.activate([
            postButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            postButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100),
            postButton.widthAnchor.constraint(equalToConstant: 200),
            
            guessTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            guessTextField.topAnchor.constraint(equalTo: postButton.bottomAnchor, constant: 100),
            guessTextField.widthAnchor.constraint(equalToConstant: 200),
            
            checkGuessButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            checkGuessButton.topAnchor.constraint(equalTo: guessTextField.bottomAnchor, constant: 20),
            checkGuessButton.widthAnchor.constraint(equalToConstant: 200),
            
            statusLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            statusLabel.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 20),
            statusLabel.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    
    private func bindViewModel() {
        
        viewModel.statusText = { [weak self] text, color
        in
            self?.statusLabel.text = text
            self?.statusLabel.textColor = color
        }
    }
    
    
    @objc func openPost() {
        coordinator?.openPost()
    }
}
