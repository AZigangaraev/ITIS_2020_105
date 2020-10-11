//
//  PostContentView.swift
//  VKNewsFeed
//
//  Created by Руслан Ахмадеев on 09.10.2020.
//

import UIKit

class PostContentView: UIView {
    
    // MARK: - UI
    
    private let postLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.postContentLabelFont
        label.textColor = Constants.postContentLabelColor
        label.numberOfLines = .max

        return label
    }()
    
    private let postImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = Constants.imageBackgroundColor
        
        return imageView
    }()
    
    // MARK: - Configuring
    
    func configureWith(text: String?, image: UIImage?) {
        
        postLabel.text = text
        postImageView.image = image
        overlayPostContentView()
    }
    
    // MARK: - Layout

    private func overlayPostContentView() {
        addSubview(postLabel)
        addSubview(postImageView)
        
        let spacing = Constants.contentSpacing

        NSLayoutConstraint.activate([
            
            postLabel.topAnchor.constraint(equalTo: topAnchor, constant: spacing),
            postLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spacing),
            postLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -spacing),
            
            postImageView.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: spacing),
            postImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            postImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: calculateAspectRatio())
            
        ])
    }
    
    private func calculateAspectRatio() -> CGFloat {
        
        guard let imageSize = postImageView.image?.size else { return 0 }
        
        let height = imageSize.height
        let width = imageSize.width
                
        return height / width
    }
}
