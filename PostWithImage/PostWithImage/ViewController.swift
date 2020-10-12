//
//  ViewController.swift
//  PostWithImage
//
//  Created by Булат Хабибуллин on 12.10.2020.
//  Copyright © 2020 Bulat Khabibullin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var postImage: UIImageView!
    @IBOutlet private var likeButton: UIButton!
    @IBOutlet private var likesLabel: UILabel!
    private var countLikes: Int = 123
    private var likeIsActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImage.image = UIImage(named: "postImage.png")
        likesLabel.text = "Нравится: \(countLikes)"
    }
    
    @IBAction func likeAction(_ sender: Any) {
        if likeIsActive == false {
            likeIsActive = true
            likeButton.setImage(UIImage(named: "redheart.png"), for: .normal)
            countLikes += 1
            likesLabel.text = "Нравится: \(countLikes)"
        } else {
            likeIsActive = false
            likeButton.setImage(UIImage(named: "heart.png"), for: .normal)
            countLikes -= 1
            likesLabel.text = "Нравится: \(countLikes)"
        }
    }
    

}

