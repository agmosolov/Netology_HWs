//
//  LoginInspector.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 10.07.2025.
//


struct LoginInspector: LoginViewControllerDelegate {
    
    func check(login: String, password: String) -> Bool {
        return Checker.shared.check(userLogin: login, userPassword: password)
    }
}

