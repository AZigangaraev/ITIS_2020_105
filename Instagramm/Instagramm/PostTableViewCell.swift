//
//  PostTableViewCell.swift
//  Instagramm
//
//  Created by Albert Ahmadiev on 08.10.2020.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet var authorImage: UIImageView!
    @IBOutlet var authorName: UILabel!
    @IBOutlet var postImage: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var countOfLike: UILabel!
    @IBOutlet var authorComment: UILabel!
    
    private var count = 0
    private var isTaped = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        authorImage.layer.cornerRadius = authorImage.frame.height/2
        count = Int.random(in: 0...100000)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }
    
    public func fillPost(authorImage: UIImage, authorName: String, postImage: UIImage, authorComment: String){
        self.authorComment.text = authorName + ": " + authorComment
        self.authorName.text = authorName
        self.postImage.image = postImage
        self.authorImage.image = authorImage
        self.countOfLike.text = "Нарвится: " + String(count)
    }
    
    @IBAction func likeTap(_ sender: AnyObject){
        if !isTaped {
            likeButton.setImage(UIImage(named: "liked"), for: .normal)
            count = count + 1
            self.countOfLike.text = "Нарвится: " + String(count)
            isTaped = true
        }else{
            likeButton.setImage(UIImage(named: "heart"), for: .normal)
            count = count - 1
            self.countOfLike.text = "Нарвится: " + String(count)
            isTaped = false
        }
    }
    
}
