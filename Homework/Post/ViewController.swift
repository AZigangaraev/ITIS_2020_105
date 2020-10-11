//
//  ViewController.swift
//  Post
//
//  Created by Robert Mukhtarov on 09.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var peopleLikedLabel: UILabel!
    @IBOutlet private var likeCounterLabel: UILabel!
    private var likeCounter = 1233 {
        didSet {
            peopleLikedLabel.text = "Понравилось \(likeCounter) людям"
            likeCounterLabel.text = String(likeCounter)
        }
    }
    
    @IBOutlet private var commentStackViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.shadowImage = UIImage()
        registerForKeyboardNotifications()
    }
    
    @IBAction private func likeButtonPressed(_ sender: LikeButton) {
        sender.isPressed.toggle()
        if sender.isPressed {
            likeCounter += 1
            likeCounterLabel.textColor = .red
        } else {
            likeCounter -= 1
            likeCounterLabel.textColor = .vkGray
        }
    }
    
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        else { return }
        let keyboardSize = keyboardFrame.size
        commentStackViewBottomConstraint.constant = -(keyboardSize.height + 10 - view.safeAreaInsets.bottom)
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        commentStackViewBottomConstraint.constant = -10
    }
    
}

