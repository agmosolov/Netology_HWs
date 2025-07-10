//
//  TestUserService.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 09.07.2025.
//

import UIKit

final class TestUserService: UserService {
    
    private var testUser: User
    
    init() {
        self.testUser = User(login: "TEST", fullName: "TestUser", avatar: UIImage(named: "Avatar")!, status: "testing....")
    }
    
    func getUser(byLogin login: String) -> User? {
        return testUser.login == login ? testUser : nil
    }
}
