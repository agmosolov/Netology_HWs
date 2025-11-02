//
//  FeedModelProtocol.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 31.10.2025.
//

protocol FeedModelProtocol {
       func check(word: String, completion: (Result<Bool, Error>) -> Void)
   }

