//
//  LoginViewControllerDelegate.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 10.07.2025.
//


protocol LoginViewControllerDelegate {
    func check(login: String, password: String) -> Bool
}
