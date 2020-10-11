//
//  FooterView.swift
//  VKNewsFeed
//
//  Created by Руслан Ахмадеев on 08.10.2020.
//

import UIKit

class FooterView: UIView {
    
    // MARK: - Like
    
    private let likeView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let likeImage: UIImageView = {
        
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = #imageLiteral(resourceName: "like")
        
        return view
    }()
    
    private let likeLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.footerLabelFont
        
        return label
    }()
    
    private var isLikeTapped = false {

        didSet {
            if isLikeTapped {
                likeImage.image = #imageLiteral(resourceName: "like_tapped")
                likeCounter += 1
            } else {
                likeImage.image = #imageLiteral(resourceName: "like")
                likeCounter -= 1
            }
        }
    }
    
    private var likeCounter = 0 {
        didSet {
            guard likeCounter > 0 else { return }
            
            likeLabel.text = String(likeCounter)
        }
    }
    
    // MARK: - Comment
    
    private let commentView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let commentImage: UIImageView = {
        
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = #imageLiteral(resourceName: "comment")
        
        return view
    }()
    
    private let commentLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "14"
        label.font = Constants.footerLabelFont
        
        return label
    }()
    
    // MARK: - Repost
    
    private let repostView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private let repostImage: UIImageView = {
        
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = #imageLiteral(resourceName: "repost")
        
        return view
    }()
    
    private let repostLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "5"
        label.font = Constants.footerLabelFont
        
        return label
    }()
    
    // MARK: - CounterView
    
    private let counterView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let counterImage: UIImageView = {
        
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = #imageLiteral(resourceName: "eye")
        
        return view
    }()
    
    private let counterLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "5"
        label.font = Constants.footerLabelFont
        
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setViewsBehavior()
        overlay()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuring
    
    func setNumberFor(likes: Int, comments: Int, reposts: Int, views: Int) {
        likeCounter = likes
        commentLabel.text = String(comments)
        repostLabel.text = String(reposts)
        counterLabel.text = String(views)
    }
    
    // MARK: - Overlay
    
    private func overlay() {
        
        addSubview(likeView)
        overlay(image: likeImage, label: likeLabel, in: likeView)
        
        addSubview(commentView)
        overlay(image: commentImage, label: commentLabel, in: commentView)
        
        addSubview(repostView)
        overlay(image: repostImage, label: repostLabel, in: repostView)
        
        addSubview(counterView)
        overlay(image: counterImage, label: counterLabel, in: counterView)
        
        NSLayoutConstraint.activate([
            likeView.topAnchor.constraint(equalTo: topAnchor),
            likeView.leadingAnchor.constraint(equalTo: leadingAnchor),
            likeView.bottomAnchor.constraint(equalTo: bottomAnchor),
            likeView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 2),
            
            commentView.topAnchor.constraint(equalTo: topAnchor),
            commentView.leadingAnchor.constraint(equalTo: likeView.trailingAnchor),
            commentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            commentView.widthAnchor.constraint(equalTo: commentView.heightAnchor, multiplier: 2),
            
            repostView.topAnchor.constraint(equalTo: topAnchor),
            repostView.leadingAnchor.constraint(equalTo: commentView.trailingAnchor),
            repostView.bottomAnchor.constraint(equalTo: bottomAnchor),
            repostView.widthAnchor.constraint(equalTo: repostView.heightAnchor, multiplier: 2),
            
            counterView.topAnchor.constraint(equalTo: topAnchor),
            counterView.trailingAnchor.constraint(equalTo: trailingAnchor),
            counterView.bottomAnchor.constraint(equalTo: bottomAnchor),
            counterView.widthAnchor.constraint(equalTo: counterView.heightAnchor, multiplier: 2)
        ])
    }

    private func overlay(image: UIImageView, label: UILabel, in view: UIView) {
        
        view.addSubview(image)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.footerIconLeadingSpacing),
            image.widthAnchor.constraint(equalToConstant: Constants.footerIconSize),
            image.heightAnchor.constraint(equalToConstant: Constants.footerIconSize),
            
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: Constants.footerLabelLeadingSpacing),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: - Behavior
    
    private func setViewsBehavior() {
        
        likeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleLikeViewTap)))
        commentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCommentViewTap)))
        repostView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRepostViewTap)))
    }
    
    @objc private func handleLikeViewTap() {
        print("like view tapped")
        isLikeTapped.toggle()
    }
    
    @objc private func handleCommentViewTap() {
        print("comment view tapped")
        
    }
    
    @objc private func handleRepostViewTap() {
        print("repost view tapped")
    }
}
