//
//  ViewController.swift
//  Homework5
//
//  Created by Олег Романов on 11.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var datePublishedLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var numberOfLikes: UILabel!
    
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
    
    @IBAction func likeButtonClicked(_ sender: Any) {
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

