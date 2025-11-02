//
//  FeedModelMock.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 31.10.2025.
//


enum FeedError: Error {
    case emptyText
    case invalidText
}

class FeedModelMock: FeedModelProtocol {
       var fakeResult: Result<Bool, Error>!

       func check(word: String, completion: (Result<Bool, Error>) -> Void) {
           completion(fakeResult)
       }
   }
