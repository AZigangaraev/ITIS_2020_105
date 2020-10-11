//
//  HeaderView.swift
//  VKNewsFeed
//
//  Created by Руслан Ахмадеев on 08.10.2020.
//

import UIKit

class HeaderView: UIView {
    
    // MARK: - Subviews
    
    private let authorImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = Constants.imageBackgroundColor
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let authorLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.headerAuthorLabelFont
        label.textColor = Constants.headerAuthorLabelColor
        
        return label
    }()
    
    private let dateLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.headerDateLabelFont
        label.textColor = Constants.headerDateLabelColor
        
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        authorImageView.layer.cornerRadius = authorImageView.frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuring
    
    func configureWith(image: UIImage, name: String, date: String) {
        authorImageView.image = image
        authorLabel.text = name
        dateLabel.text = date
    }
    
    
    // MARK: - Layout
    
    private func layout() {
        
        addSubview(authorImageView)
        
        let stackView = UIStackView(arrangedSubviews: [authorLabel, dateLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            authorImageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.defaultSpacing),
            authorImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.defaultSpacing),
            authorImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.defaultSpacing),
            authorImageView.widthAnchor.constraint(equalTo: authorImageView.heightAnchor),

            stackView.leadingAnchor.constraint(equalTo: authorImageView.trailingAnchor, constant: Constants.defaultSpacing),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.defaultSpacing),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
