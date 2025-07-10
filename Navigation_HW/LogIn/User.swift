//
//  User.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 09.07.2025.
//

import UIKit


final class User {
    
    var login: String
    var fullName: String
    var avatar: UIImage
    var status: String
    
    init(login: String, fullName: String, avatar: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}


