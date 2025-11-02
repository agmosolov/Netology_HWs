//
//  FeedViewModel.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 22.07.2025.
//

import UIKit

   final class FeedViewModel {
       
       private let feedModel: FeedModelProtocol
       
       var statusText: ((String, UIColor) -> Void)?
       
       init(feedModel: FeedModelProtocol) {
           self.feedModel = feedModel
       }

       func checkGuess(word: String?) {
           guard let word = word, !word.isEmpty else {
               statusText?("Поле не должно быть пустым", .red)
               return
           }

           feedModel.check(word: word) { [weak self] result in
               guard let self = self else { return }
               switch result {
               case .success(true):
                   self.statusText?("Верно!", .systemGreen)
               case .success(false):
                   self.statusText?("Не верно!", .red)
               case .failure(let error):
                   self.statusText?("Ошибка: \(error.localizedDescription)", .red)
               }
           }
       }
   }
