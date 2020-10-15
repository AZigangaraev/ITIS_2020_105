//
//  ViewController.swift
//  VKPostHomework
//
//  Created by Саркис Катвалян on 09/10/2020.
//  Copyright © 2020 Саркис Катвалян. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myPhoto: UIImageView!
    @IBOutlet var myName: UILabel!
    @IBOutlet var myTime: UILabel!
    @IBOutlet var myComment: UILabel!
    
    @IBOutlet var svetaPhoto: UIImageView!
    @IBOutlet var alinaPhoto: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    @IBOutlet var whoLiked: UILabel!
    @IBOutlet var commentsField: UITextField!
    
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var countOfLikes: UILabel!
    
    var notLiked: Bool = true
    var isDisliked: Bool = true
    var isTapped: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        myName.text = "Sarkis Katvalyan"
        myName.textColor = .black
        myTime.text = "two hours ago"
        myTime.textColor = .gray
        myComment.text = "Пост для домашки по iOS. Листайте дальше."
        myComment.textColor = .black
        whoLiked.text = "Svetlana, Alina and 7 more people like this"
        whoLiked.textColor = .gray
        
        myPhoto.makeRounded()
        svetaPhoto.makeRounded()
        alinaPhoto.makeRounded()
        commentsField.makeRoundedTextField()
        commentsField.attributedPlaceholder = NSAttributedString(string: " Write a comment", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func likeFunction(_ sender: Any) {
        if !notLiked {
            countOfLikes.text = "9"
likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = UIColor.lightGray
            notLiked = true
        }
        else {
            countOfLikes.text = "10"
likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = UIColor.red
            notLiked = false
        }
    }
    
    
    @IBAction func hideTheKeyboard(_ sender: Any) {
            if isTapped {
                commentsField.resignFirstResponder()
            }
        }
}

extension UIImageView {
    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.white.cgColor
    }
}
extension UITextField {
    func makeRoundedTextField() {
        self.layer.masksToBounds = true
               self.layer.cornerRadius = 15
               self.layer.borderWidth = 1
               self.layer.borderColor = UIColor.lightGray.cgColor
    }
}

