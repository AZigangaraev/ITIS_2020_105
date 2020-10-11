//
//  ViewController.swift
//  InstagramPost
//
//  Created by Rishat on 05.10.2020.
//  Copyright © 2020 Rishat Latypov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var count = 827037
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var countLike: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        likeButton.adjustsImageWhenHighlighted = false
    }

    @IBAction func likeAction(_ sender: Any) {
        if countLike.text == "827037" {
            likeButton.setImage(#imageLiteral(resourceName: "red like"), for: .normal)
            countLike.text = String(count + 1)
        } else if countLike.text == "827038" {
            likeButton.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            countLike.text = String(count)
        }
    }
}

