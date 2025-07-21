//
//  FeedViewController.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 06.05.2025.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private let feedModel = FeedModel()
    private let statusLabel = UILabel()
    private let guessTextField = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "ЛЕНТА"
        setupUI()
    }
    
    
    private func setupUI() {
        
        let postButton = CustomButton(
            title: "Открыть пост",
            titleColor: .white,
            backgroundColor: .customBlue)
        { [weak self] in
            self?.openPost()
        }
        postButton.translatesAutoresizingMaskIntoConstraints = false
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
            self?.checkGuess()
        }
        checkGuessButton.translatesAutoresizingMaskIntoConstraints = false
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
    
    
    @objc func openPost() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
    private func checkGuess() {
        guard let guess = guessTextField.text, !guess.isEmpty else {
            statusLabel.text = "Поле не должно быть пустым"
            statusLabel.textColor = .red
            return
        }
        
        if feedModel.check(word: guess) {
            statusLabel.text = "Верно!"
            statusLabel.textColor = .systemGreen
        } else {
            statusLabel.text = "Неверно!"
            statusLabel.textColor = .red
        }
    }
}
