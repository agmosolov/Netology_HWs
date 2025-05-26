//
//  PostTableViewCell..swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 26.05.2025.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    private let authorLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let postImageView = UIImageView()
    private let likesLabel = UILabel()
    private let viewsLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        authorLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorLabel.textColor = .black
        authorLabel.numberOfLines = 2
        
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .systemGray
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        
        postImageView.contentMode = .scaleAspectFit
        postImageView.clipsToBounds = true
        postImageView.backgroundColor = .black
        
        likesLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        viewsLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        [authorLabel, descriptionLabel, postImageView, likesLabel, viewsLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
      
      func configure(with post: Post) {
          authorLabel.text = post.author
          descriptionLabel.text = post.description
          postImageView.image = UIImage(named: post.image)
          likesLabel.text = "Likes: \(post.likes)"
          viewsLabel.text = "Views: \(post.views)"
      }
  }
