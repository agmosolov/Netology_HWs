//
//  FeedViewModelTests.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 31.10.2025.
//

import XCTest
   @testable import Navigation_HW

   class FeedViewModelTests: XCTestCase {
       var viewModel: FeedViewModel!
       var feedModelMock: FeedModelMock!

       override func setUp() {
           super.setUp()
           feedModelMock = FeedModelMock()
           viewModel = FeedViewModel(feedModel: )
       }

       func testCheckGuessWithCorrectWord() {
           feedModelMock.fakeResult = .success(true)
           viewModel.checkGuess(word: "swift")
       }

    func testCheckGuessWithIncorrectWord() {
        feedModelMock.fakeResult = .success(false)
        viewModel.checkGuess(word: "wrong")
    }

    func testCheckGuessWithEmptyWord() {
        feedModelMock.fakeResult = .failure(FeedError.emptyText)
        viewModel.checkGuess(word: "")
    }

}
