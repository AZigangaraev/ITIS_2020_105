//
//  CommunityTitleCell.swift
//  Homework4
//
//  Created by Ruslan Khanov on 06.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class CommunityTitleCell: UITableViewCell {
    
    var communityName: String? {
        didSet {
            communityNameLabel.text = communityName
        }
    }
    var postingTime: String? {
        didSet {
            postingTimeLabel.text = postingTime
        }
    }
    var communityImage: UIImage? {
        didSet {
            communityImageView.image = communityImage
        }
    }

    private let communityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.frame.size.width = 50.0
        imageView.frame.size.height = 50.0
        
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let communityNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let postingTimeLabel: UILabel = {
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
        
        // Add stack view
        let textStackView = UIStackView()
        textStackView.axis = .vertical
        textStackView.distribution = .fillEqually
        textStackView.alignment = .leading
        textStackView.spacing = -5
        
        textStackView.addArrangedSubview(communityNameLabel)
        textStackView.addArrangedSubview(postingTimeLabel)
        
        addSubview(textStackView)
        addSubview(communityImageView)

        // Configure constraints
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            communityImageView.heightAnchor.constraint(equalToConstant: 50),
            communityImageView.widthAnchor.constraint(equalToConstant: 50),
            communityImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            communityImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            communityImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            
            textStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -1),
            textStackView.leadingAnchor.constraint(equalTo: communityImageView.trailingAnchor, constant: 8),
            textStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            textStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
