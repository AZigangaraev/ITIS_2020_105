//
//  ViewController.swift
//  Instagram
//
//  Created by Эвелина on 05.10.2020.
//  Copyright © 2020 Эвелина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   private var numberLike: Int = 228
   private  var isLiked: Bool = false
    @IBOutlet weak var countLikes: UILabel!
    @IBOutlet weak var like: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func likeButton(_ sender: UIButton) {
        if numberLike == 228{
        like.tintColor = .red
            numberLike = numberLike + 1;
           countLikes.text = String(numberLike)
            
        }
      else {
      like.tintColor = .white
            numberLike = numberLike - 1;
            countLikes.text = String(numberLike)
            
        }
    }
}
