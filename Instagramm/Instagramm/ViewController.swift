//
//  ViewController.swift
//  Instagramm
//
//  Created by Albert Ahmadiev on 05.10.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var postsTable: UITableView!
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.postsTable.delegate = self
        self.postsTable.dataSource = self
        postsTable.tableFooterView = UIView()
        downloadPosts()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        cell.fillPost(authorImage: posts[indexPath.row].authorImage, authorName: posts[indexPath.row].authorName, postImage: posts[indexPath.row].postImage, authorComment:posts[indexPath.row].authorComment)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    private func downloadPosts(){
        let post1 = Post(authorImage: #imageLiteral(resourceName: "authorImage1"), authorName: "cristiano", postImage: #imageLiteral(resourceName: "postImage1"), authorComment:
                            "Excelente trabalho equipa!👏🏽 \n Continuar a trabalhar com a mesma atitude e \n ambição para conseguirmos o nosso objetivo principal! 💪🏽\n Obrigado pelo apoio, juntos somos mais fortes! 🇵🇹💪🏽")
        let post2 = Post(authorImage: #imageLiteral(resourceName: "authorImage2"), authorName: "apple", postImage: #imageLiteral(resourceName: "postImage2"), authorComment:
                            "“I wanted to capture a moment with my horse, Sirena, to show the contrast between her ginger tone and the grass she was walking through. You can see the changing of the season from a dry winter to a green spring.” #ShotoniPhone by Mariana N. @mnarvaezdlp")
        let post3 = Post(authorImage: #imageLiteral(resourceName: "authorImage1"), authorName: "cristiano", postImage: #imageLiteral(resourceName: "postImage3"), authorComment:
                            "😜")

        posts.append(post2)
        posts.append(post1)
        posts.append(post3)
        
    }
    
}

class Post {
    var authorImage: UIImage
    var authorName: String
    var postImage: UIImage
    var authorComment: String
    
    init(authorImage: UIImage, authorName: String, postImage: UIImage, authorComment: String) {
        self.authorImage = authorImage
        self.authorName = authorName
        self.postImage = postImage
        self.authorComment = authorComment
    }
}

