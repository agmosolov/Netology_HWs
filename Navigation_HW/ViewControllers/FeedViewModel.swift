//
//  FeedViewModel.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 22.07.2025.
//

import UIKit


final class FeedViewModel {
    
    private let secretWord = "swift"
    
    var statusText: ((String, UIColor) -> Void)?
    
    func checkGuess(word: String?) {
        
        guard let word = word, !word.isEmpty else {
            statusText?("Поле не должно быть пустым", .red)
            return
        }
        
        if check(word: word) {
            statusText?("Верно!", .systemGreen)
        } else {
            statusText?("Не верно!", .red)
        }
    }
    
    private func check(word: String) -> Bool {
            return word.lowercased() == secretWord.lowercased()
        }
}
