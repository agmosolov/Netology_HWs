//
//  FeedViewModelTests.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 08.11.2025.
//

import XCTest
@testable import Navigation_HW

final class FeedViewModelTests: XCTestCase {
    
    var viewModel: FeedViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = FeedViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testCheckGuessWithEmptyWord() {
        var statusMessage: String?
        var statusColor: UIColor?
        
        viewModel.statusText = { message, color in
            statusMessage = message
            statusColor = color
        }
        
        viewModel.checkGuess(word: "")
        
        XCTAssertEqual(statusMessage, "Поле не должно быть пустым")
        XCTAssertEqual(statusColor, .red)
    }
    
    func testCheckGuessWithCorrectWord() {
        var statusMessage: String?
        var statusColor: UIColor?
        
        viewModel.statusText = { message, color in
            statusMessage = message
            statusColor = color
        }
        
        viewModel.checkGuess(word: "swift")
        
        XCTAssertEqual(statusMessage, "Верно!")
        XCTAssertEqual(statusColor, .systemGreen)
    }
    
    func testCheckGuessWithIncorrectWord() {
        var statusMessage: String?
        var statusColor: UIColor?
        
        viewModel.statusText = { message, color in
            statusMessage = message
            statusColor = color
        }
        
        viewModel.checkGuess(word: "wrong")
        
        XCTAssertEqual(statusMessage, "Не верно!")
        XCTAssertEqual(statusColor, .red)
    }
}
