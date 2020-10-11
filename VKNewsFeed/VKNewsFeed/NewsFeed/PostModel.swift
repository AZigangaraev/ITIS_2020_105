//
//  PostModel.swift
//  VKNewsFeed
//
//  Created by Руслан Ахмадеев on 07.10.2020.
//

import UIKit

struct PostModel {
    
    let username: String
    let userImage: UIImage
    let date: String
    
    let contentText: String?
    let contentImage: UIImage?
    
    let likesCount: Int
    let commentsCount: Int
    let repostsCount: Int
    let viewsCount: Int
}
