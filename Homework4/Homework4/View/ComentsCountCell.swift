//
//  ComentsCountCell.swift
//  Homework4
//
//  Created by Ruslan Khanov on 11.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class CommentsCountCell: UITableViewCell {

    private let commentsCountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.text = "0 COMMENTS"
        
        return label
    }()
    
    private let mostInterestingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Most interesting \u{25bd}"
        
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
        commentsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        mostInterestingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(commentsCountLabel)
        addSubview(mostInterestingLabel)
        
        NSLayoutConstraint.activate([
            commentsCountLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            commentsCountLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            commentsCountLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            mostInterestingLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            mostInterestingLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            mostInterestingLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
