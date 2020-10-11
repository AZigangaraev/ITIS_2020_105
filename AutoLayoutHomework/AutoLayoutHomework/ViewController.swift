//
//  ViewController.swift
//  AutoLayoutHomework
//
//  Created by Никита Ляпустин on 05.10.2020.
//  Copyright © 2020 Pasandep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var commentProfileImage: UIImageView!
    @IBOutlet var likeCountLabel: UILabel!
    @IBOutlet var postImage: UIImageView!
    @IBOutlet var postTextLabel: UILabel!
    @IBOutlet var commentLikeButton: UIButton!
    
    
    var postIsLiked = false
    var likeCount = 13
    var commentIsLiked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        
        commentProfileImage.layer.cornerRadius = commentProfileImage.frame.height/2
        
        likeCountLabel.text = "\(likeCount)"
    }
    
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        if postIsLiked {
            likeCount = likeCount - 1
            likeButton.setImage(#imageLiteral(resourceName: "like_icon.png"), for: UIControl.State())
            likeCountLabel.text = "\(likeCount)"
            postIsLiked = false;
        } else {
            likeCount = likeCount + 1
            likeButton.setImage(#imageLiteral(resourceName: "like_icon_red.png"), for: UIControl.State())
            likeCountLabel.text = "\(likeCount)"
            postIsLiked = true
        }
    }
    
    @IBAction func commentLikeButtonTapped(_ sender: Any) {
        if commentIsLiked {
            commentLikeButton.setImage(#imageLiteral(resourceName: "like_icon.png"), for: UIControl.State())
            commentIsLiked = false;
        } else {
            commentLikeButton.setImage(#imageLiteral(resourceName: "like_icon_red.png"), for: UIControl.State())
            commentIsLiked = true
        }
    }
}

