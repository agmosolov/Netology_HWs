//
//  ToDoModel.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 28.09.2025.
//

import Foundation

struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
