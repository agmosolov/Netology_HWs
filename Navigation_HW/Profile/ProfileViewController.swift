//
//  ProfileViewController.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 06.05.2025.
//

import UIKit
import StorageService

final class ProfileViewController: UIViewController {
    
    private let profileHeaderView = ProfileHeaderView()
    private var posts: [Post] = []
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileHeaderView.backgroundColor = .white
        
        setupPosts()
        setupTableView()
        setupLayout()
        
    }
    
    private func setupPosts() {
        posts = [
            Post(author: "Александр, город Домодедово", description: "Лето - прекрасная возможность выбраться с семьей на речку или озеро", image: "Summer", likes: 15, views: 35),
            Post(author: "Настя, город Самара", description: "Осенью так и хочется погулять по парку и почитать книгу на скамейке", image: "Autumn", likes: 14, views: 40),
            Post(author: "Денис, город Пушкино", description: "Зимой в лесу просто сказочно", image: "Winter", likes: 11, views: 45),
            Post(author: "Дарья, город Москва", description: "Весной в лесу всегда ощущвется свежесть", image: "Spring", likes: 9, views: 13)
        ]
    }
    
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
    }
    
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return posts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosCell", for: indexPath) as? PhotosTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
                return UITableViewCell()
            }
            
            let post = posts[indexPath.row]
            cell.configure(with: post)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return section == 0 ? profileHeaderView : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 220 : 0
    }
}
