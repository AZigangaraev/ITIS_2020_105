//
//  CommentCell.swift
//  Homework4
//
//  Created by Ruslan Khanov on 11.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.numberOfLines = 0
        label.text = "Ruslan Check"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let commentTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.text = "это смешно"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let postingTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.numberOfLines = 0
        label.text = "an hour ago"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.frame.size.width = 40.0
        imageView.frame.size.height = 40.0
        imageView.image = UIImage(named: "userPic0")
        
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        
        let textStackView = UIStackView()
        textStackView.axis = .vertical
        textStackView.distribution = .fillEqually
        textStackView.alignment = .top
        textStackView.spacing = 2
        
        textStackView.addArrangedSubview(userNameLabel)
        textStackView.addArrangedSubview(commentTextLabel)
        textStackView.addArrangedSubview(postingTimeLabel)
        
        addSubview(textStackView)
        addSubview(userImageView)

        // Configure constraints
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userImageView.heightAnchor.constraint(equalToConstant: 40.0),
            userImageView.widthAnchor.constraint(equalToConstant: 40.0),
            userImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            userImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            userImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            
            textStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -1),
            textStackView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 15),
            textStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            textStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
