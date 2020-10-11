//
//  ViewController.swift
//  Homework5
//
//  Created by Рустем on 09.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var likeButton: UIButton!
    var like = false
    @IBOutlet weak var likeNumber: UILabel!
    
    var likeN = 134
    
    override func viewDidLoad() {
        super.viewDidLoad()
        likeButton.setImage(UIImage(named: "like"), for: .normal)
        likeNumber.isEnabled = false
        
    }


    @IBAction func turnLike(_ sender: Any) {
        like = !like
        if(like){
            likeButton.setImage(UIImage(named: "like1"), for: .normal)
            likeNumber.isEnabled = true
            likeNumber.text = "\(likeN + 1)"
        } else {
            likeButton.setImage(UIImage(named: "like"), for: .normal)
            likeNumber.isEnabled = false
            likeNumber.text = "\(likeN)"
        }
    }
    
}

