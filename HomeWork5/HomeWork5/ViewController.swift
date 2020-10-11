//
//  ViewController.swift
//  HomeWork5
//
//  Created by Nail on 08.10.2020.
//  Copyright © 2020 Nail. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var postImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var likeOutlet: UIButton!
    @IBAction func likeButton(_ sender: UIButton) {
         if sender.currentImage == UIImage(named: "heart") {
            sender.setImage(UIImage(named:"heart2"), for: .normal)
           }
           else {
            sender.setImage( UIImage(named:"heart"), for: .normal)
           }
        
    }
    
}

