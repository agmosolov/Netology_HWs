//
//  Checker.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 10.07.2025.
//

class Checker {
    
    private let login: String = "AAA"
    private let password: String = "123"
    
    static let shared = Checker()
    private init() {}
    
    func check(userLogin: String, userPassword: String) -> Bool {
        return userLogin == login && userPassword == password
    }
}
