//
//  LoginFactory.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 10.07.2025.
//

protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}

struct MyLoginFactory: LoginFactory {
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
