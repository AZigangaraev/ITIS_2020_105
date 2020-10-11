//
//  PostViewController.swift
//  Homework4
//
//  Created by Ruslan Khanov on 06.10.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class PostViewController: UITableViewController {

    var likesCount = 666
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor(red: 25.0/255.0 , green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0)

        tableView.register(CommunityTitleCell.self, forCellReuseIdentifier: String(describing: CommunityTitleCell.self))
        tableView.register(TextViewCell.self, forCellReuseIdentifier: String(describing: TextViewCell.self))
        tableView.register(PostImageCell.self, forCellReuseIdentifier: String(describing: PostImageCell.self))
        tableView.register(PeopleLikedCell.self, forCellReuseIdentifier: String(describing: PeopleLikedCell.self))
        tableView.register(LikeButtonCell.self, forCellReuseIdentifier: String(describing: LikeButtonCell.self))
        tableView.register(CommentsCountCell.self, forCellReuseIdentifier: String(describing: CommentsCountCell.self))
        tableView.register(CommentCell.self, forCellReuseIdentifier: String(describing: CommentCell.self))
        
        tableView.separatorColor = .clear
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommunityTitleCell.self), for: indexPath) as! CommunityTitleCell
            cell.backgroundColor = .clear
            cell.communityImage = UIImage(named: "logo")
            cell.communityName = "сомнительные картинки"
            cell.postingTime = "an hour ago"
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextViewCell.self), for: indexPath) as! TextViewCell
            cell.postText = "it's meme"
            cell.backgroundColor = .clear
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostImageCell.self), for: indexPath) as! PostImageCell
            cell.postImage = UIImage(named: "meme")
            cell.backgroundColor = .clear
                    
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PeopleLikedCell.self), for: indexPath) as! PeopleLikedCell
            cell.backgroundColor = .clear
            cell.firstUserImage = UIImage(named: "userPic0")
            cell.secondUserImage = UIImage(named: "userPic1")
            cell.likesCount = likesCount
            
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: LikeButtonCell.self), for: indexPath) as! LikeButtonCell
            cell.backgroundColor = .clear
            cell.likesCount = likesCount
            
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommentsCountCell.self), for: indexPath) as! CommentsCountCell
            cell.backgroundColor = .clear
            
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommentCell.self), for: indexPath) as! CommentCell
            cell.backgroundColor = .clear
            
            return cell
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller")
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 4{
            return 60.0
        }
        if indexPath.row == 5 {
            return 40.0
        }
        if indexPath.row == 6 {
            return 70.0
        }
        return UITableView.automaticDimension
    }

}
