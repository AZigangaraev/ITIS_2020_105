//
//  ViewController.swift
//  Homework5
//
//  Created by Олег Романов on 11.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var postImageView: UIImageView!
    @IBOutlet private var usernameLabel: UILabel!
    @IBOutlet private var datePublishedLabel: UILabel!
    @IBOutlet private var likeButton: UIButton!
    @IBOutlet private var numberOfLikes: UILabel!
    
    private var isLike: Bool = false
    private var countLikes = 824
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
    }

    private func setupStyle() {
        avatarImageView.layer.cornerRadius = 35
        numberOfLikes.text = (String) (countLikes)
    }
    
    @IBAction private func likeButtonClicked(_ sender: Any) {
        if !isLike {
            countLikes += 1
            numberOfLikes.text = (String) (countLikes)
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = UIColor.red
            isLike = true
        } else {
            countLikes -= 1
            numberOfLikes.text = (String) (countLikes)
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = UIColor.gray
            isLike = false
        }
    }
}

