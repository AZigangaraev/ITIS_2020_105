//
//  LikeButtonCell.swift
//  Homework4
//
//  Created by Ruslan Khanov on 08.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class LikeButtonCell: UITableViewCell {

    private let notLikeImage = UIImage(named: "like-2")
    private let likeImage = UIImage(named: "like")
    
    var likesCount: Int? {
        didSet {
            likesCountLabel.text = "\(likesCount!)"
        }
    }
    
    var repostsCount: Int? {
        didSet {
            repostsCountLabel.text = "\(repostsCount!)"
        }
    }
    
    private let likesCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let repostImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.frame.size.width = 30.0
        imageView.frame.size.height = 30.0
        imageView.image = UIImage(named: "share")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let repostsCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "2"
        
        return label
    }()
    
    private let eyeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.frame.size.width = 18.0
        imageView.frame.size.height = 18.0
        imageView.image = UIImage(named: "eye")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let viewsCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "19,8K"
        //label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func like(sender: UIButton) {
        if let buttonImage = sender.imageView?.image {
            if buttonImage == notLikeImage {
                sender.setImage(likeImage, for: .normal)
                if let likes = likesCount {
                    likesCountLabel.text = "\(likes + 1)"
                }
            } else {
                sender.setImage(notLikeImage, for: .normal)
                if let likes = likesCount {
                    likesCountLabel.text = "\(likes)"
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        // Configure like button
        let likeButton = UIButton()
        likeButton.setImage(notLikeImage, for: .normal)
        likeButton.addTarget(self, action: #selector(like), for: .touchUpInside)
        likeButton.translatesAutoresizingMaskIntoConstraints = false

        
        let likeStackView = UIStackView()
        likeStackView.axis = .horizontal
        likeStackView.alignment = .center
        //likeStackView.distribution = .fill
        likeStackView.spacing = 10
        likeStackView.addArrangedSubview(likeButton)
        likeStackView.addArrangedSubview(likesCountLabel)
        
        let repostStackView = UIStackView()
        repostStackView.axis = .horizontal
        repostStackView.alignment = .center
        
        repostStackView.spacing = 10
        repostStackView.addArrangedSubview(repostImageView)
        repostStackView.addArrangedSubview(repostsCountLabel)
        
        let likeAndRepostStackView = UIStackView()
        likeAndRepostStackView.axis = .horizontal
        likeAndRepostStackView.alignment = .center
        
        likeAndRepostStackView.spacing = 0
        likeAndRepostStackView.addArrangedSubview(likeStackView)
        likeAndRepostStackView.addArrangedSubview(repostStackView)
        
        likeAndRepostStackView.translatesAutoresizingMaskIntoConstraints = false
                
        let viewsStackView = UIStackView()
        viewsStackView.axis = .horizontal
        viewsStackView.alignment = .center
        viewsStackView.spacing = 5
        
        viewsStackView.addArrangedSubview(eyeImageView)
        viewsStackView.addArrangedSubview(viewsCountLabel)
        
        viewsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(likeAndRepostStackView)
        addSubview(viewsStackView)
        
        // Configure constraints
        eyeImageView.widthAnchor.constraint(equalToConstant: 18.0).isActive = true
        eyeImageView.heightAnchor.constraint(equalToConstant: 18.0).isActive = true
        repostImageView.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        repostImageView.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        likesCountLabel.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        viewsCountLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        likeAndRepostStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        likeAndRepostStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        likeAndRepostStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        //likeAndRepostStackView.trailingAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        viewsStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        viewsStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        viewsStackView.trailingAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
