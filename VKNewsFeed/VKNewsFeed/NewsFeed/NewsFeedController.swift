//
//  NewsFeedController.swift
//  VKNewsFeed
//
//  Created by Руслан Ахмадеев on 07.10.2020.
//

import UIKit

class NewsFeedController: UIViewController {
    
    let cellIdentifier = "NewsFeedCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Data
    
    var dataSource: [PostModel]!
    
    let dataManager = DataManager()
    
    // MARK: - Loading
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = dataManager.obtainData()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(NewsFeedCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = #colorLiteral(red: 0.7859970927, green: 0.7763057351, blue: 0.838460505, alpha: 1)
                
    }
}

// MARK: - TableViewDelegate, TableViewDataSource

extension NewsFeedController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! NewsFeedCell
        cell.configureWith(dataSource[indexPath.row])
        
        return cell
    }
}

