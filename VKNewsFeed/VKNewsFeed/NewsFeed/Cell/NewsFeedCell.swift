//
//  NewsFeedCell.swift
//  VKNewsFeed
//
//  Created by Руслан Ахмадеев on 08.10.2020.
//

import UIKit

class NewsFeedCell: UITableViewCell {
    
    // MARK: - Subviews
    
    private let cardView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .white
        
        return view
    }()
        
    private let headerView: HeaderView = {
        
        let view = HeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    private let postContentView: PostContentView = {
        
        let view = PostContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let footerView: FooterView = {
        
        let view = FooterView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuring
    
    func configureWith(_ post: PostModel) {
        
        headerView.configureWith(image: post.userImage, name: post.username, date: post.date)
        
        postContentView.configureWith(text: post.contentText, image: post.contentImage)
        
        footerView.setNumberFor(likes: post.likesCount,
                                comments: post.commentsCount,
                                reposts: post.repostsCount,
                                views: post.viewsCount)
    }

    // MARK: - Layout
    
    private func layout() {
        
        contentView.addSubview(cardView)
        cardView.addSubview(headerView)
        cardView.addSubview(postContentView)
        cardView.addSubview(footerView)

        NSLayoutConstraint.activate([
            
            // layout cardView
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            // layout headerView
            headerView.topAnchor.constraint(equalTo: cardView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Constants.headerHeight),
            
            // layout postContentView
            postContentView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            postContentView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            postContentView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            
            // layout footerView
            footerView.topAnchor.constraint(equalTo: postContentView.bottomAnchor),
            footerView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: Constants.footerHeight),
        ])
    }
}
