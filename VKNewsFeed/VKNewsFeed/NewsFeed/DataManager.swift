//
//  DataManager.swift
//  VKNewsFeed
//
//  Created by Руслан Ахмадеев on 07.10.2020.
//

import UIKit

class DataManager {
    
    func obtainData() -> [PostModel] {
        
        let data = [
            PostModel(username: "Вася Пупкин",
                      userImage: #imageLiteral(resourceName: "slider_puffin_before_mobile"),
                      date: "Сегодня",
                      contentText: nil,
                      contentImage: #imageLiteral(resourceName: "baelen"),
                      likesCount: 5,
                      commentsCount: 4,
                      repostsCount: 6,
                      viewsCount: 16),
            
            PostModel(username: "Иван Иванов",
                      userImage: #imageLiteral(resourceName: "images"),
                      date: "Вчера",
                      contentText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      contentImage: #imageLiteral(resourceName: "image-human-brain_99433-298"),
                      likesCount: 3,
                      commentsCount: 2,
                      repostsCount: 2,
                      viewsCount: 34),
            
            PostModel(username: "Имя Имя",
                      userImage: #imageLiteral(resourceName: "images"),
                      date: "Вчера",
                      contentText: "А у меня нет картинки :(( ",
                      contentImage: nil,
                      likesCount: 10,
                      commentsCount: 111,
                      repostsCount: 2,
                      viewsCount: 11)
        ]
        
        return data
    }
}
