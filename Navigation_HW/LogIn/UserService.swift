//
//  UserService.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 09.07.2025.
//



protocol UserService {
    func getUser(byLogin login: String) -> User?
}


