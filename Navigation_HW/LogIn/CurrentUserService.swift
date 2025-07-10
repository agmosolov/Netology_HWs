//
//  CurrentUserService.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 09.07.2025.
//

final class CurrentUserService: UserService {
    
    private var currentUser: User
    
    init(user: User) {
        self.currentUser = user
    }
    
    func getUser(byLogin login: String) -> User? {
        return currentUser.login == login ? currentUser : nil
    }
}
