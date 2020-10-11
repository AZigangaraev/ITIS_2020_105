//
//  PeopleLikedCell.swift
//  Homework4
//
//  Created by Ruslan Khanov on 08.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class PeopleLikedCell: UITableViewCell {
    
    private static let imageSize: CGFloat = 35.0

    var likesCount: Int? {
        didSet {
            likesCountLabel.text = "\(likesCount!) people like this"
        }
    }
    
    var firstUserImage: UIImage? {
        didSet {
            firstUserLikeImageView.image = firstUserImage
        }
    }
    
    var secondUserImage: UIImage? {
        didSet {
            secondUserLikeImageView.image = secondUserImage
        }
    }
    
    private let firstUserLikeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.frame.size.width = imageSize
        imageView.frame.size.height = imageSize
        
        imageView.layer.cornerRadius = imageSize / 2
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let secondUserLikeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.frame.size.width = imageSize
        imageView.frame.size.height = imageSize
        
        imageView.layer.cornerRadius = imageSize / 2
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let likesCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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

        let usersLikesStackView = UIStackView()
        usersLikesStackView.axis = .horizontal
        usersLikesStackView.distribution = .fillEqually
        usersLikesStackView.alignment = .leading
        usersLikesStackView.spacing = -5
        usersLikesStackView.addArrangedSubview(firstUserLikeImageView)
        usersLikesStackView.addArrangedSubview(secondUserLikeImageView)
        
        addSubview(usersLikesStackView)
        addSubview(likesCountLabel)
        
        // Configure constraints
        
        usersLikesStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            firstUserLikeImageView.heightAnchor.constraint(equalToConstant: PeopleLikedCell.imageSize),
            firstUserLikeImageView.widthAnchor.constraint(equalToConstant: PeopleLikedCell.imageSize),
            secondUserLikeImageView.heightAnchor.constraint(equalToConstant: PeopleLikedCell.imageSize),
            secondUserLikeImageView.widthAnchor.constraint(equalToConstant: PeopleLikedCell.imageSize),
            
            usersLikesStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            usersLikesStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            usersLikesStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            
            likesCountLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            likesCountLabel.leadingAnchor.constraint(equalTo: usersLikesStackView.trailingAnchor, constant: 10),
            likesCountLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            likesCountLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
