//
//  FavoritesViewController.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 12.10.2025.
//

import UIKit

import UIKit
import StorageService

class FavoritesViewController: UIViewController {
    
    private var favoritePosts: [FavoritePost] = []
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Favorites"
        
        setupTableView()
        fetchFavoritePosts()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Удалить все", style: .plain, target: self, action: #selector(deleteAllFavorites))
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlePostAdded), name: NSNotification.Name("PostAdded"), object: nil)
    }
    
    @objc private func handlePostAdded() {
        fetchFavoritePosts()
    }
    
    deinit {
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name("PostAdded"), object: nil)
        }
    
    @objc private func deleteAllFavorites() {
        let alert = UIAlertController(title: "Подтверждение", message: "Вы уверены, что хотите удалить все понравившиеся посты?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Удалить", style: .destructive, handler: { _ in
            CoreDataManager.shared.deleteAllPosts()
            self.favoritePosts.removeAll()
            self.tableView.reloadData()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func fetchFavoritePosts() {
        favoritePosts = CoreDataManager.shared.fetchAllPosts()
        tableView.reloadData()
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        
        let favoritePost = favoritePosts[indexPath.row]
        let post = Post(author: favoritePost.author ?? "",
                        description: favoritePost.postDescription ?? "",
                        image: favoritePost.image ?? "",
                        likes: Int(favoritePost.likes),
                        views: Int(favoritePost.views))
        cell.configure(with: post)
        return cell
    }
}

