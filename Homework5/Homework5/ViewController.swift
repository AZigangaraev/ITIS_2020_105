//
//  ViewController.swift
//  Homework5
//
//  Created by Joseph on 05.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var voteCounter: UILabel!
    
    @IBOutlet weak var downVoteButton: UIButton!
    @IBOutlet weak var upvoteButton: UIButton!
    var isUpvoted = false
    var isDownvoted = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func upvote(_ sender: Any) {
        if isUpvoted {
            self.voteCounter.text = "~"
            upvoteButton.tintColor = UIColor.darkGray
            downVoteButton.tintColor = UIColor.darkGray
            isUpvoted = false
        } else {
            self.voteCounter.text = "1"
            upvoteButton.tintColor = UIColor.blue
            downVoteButton.tintColor = UIColor.darkGray
            isUpvoted = true
        }
    }

    @IBAction func downvote(_ sender: Any) {
        if isDownvoted {
            self.voteCounter.text = "~"
            downVoteButton.tintColor = UIColor.darkGray
            upvoteButton.tintColor = UIColor.darkGray
            isDownvoted = false
        } else {
            self.voteCounter.text = "-1"
            downVoteButton.tintColor = UIColor.blue
            upvoteButton.tintColor = UIColor.darkGray
            isDownvoted = true
        }
    }
    @IBAction func comments(_ sender: Any) {
        showAlert(title: "Not Implemented", message: "Comments are not implemented")
    }
    @IBAction func share(_ sender: Any) {
        showAlert(title: "Not Implemented", message: "Share is not implemented")
    }
    @IBAction func archive(_ sender: Any) {
        showAlert(title: "Not Implemented", message: "Archive is not implemented")
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(
                title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
