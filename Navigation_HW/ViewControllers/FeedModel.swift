//
//  FeedModel.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 21.07.2025.
//

final class FeedModel {
    
    private let secretWord = "swift"
    
    func check(word: String) -> Bool {
        return word.lowercased() == secretWord.lowercased()
    }
}
