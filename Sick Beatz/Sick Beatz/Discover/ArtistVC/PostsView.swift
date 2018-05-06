//
//  PostsView.swift
//  Sick Beatz
//
//  Created by Henry on 5/5/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit

class PostsView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    var artist: String!
    
    var tableView: UITableView!
    let reuseId = "reusablePostCell"
    
    var posts: [Post] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView = UITableView()
        tableView.bounces = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(PostCell.self, forCellReuseIdentifier: reuseId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(tableView)
        
        setupConstraints()
        
        getPosts()
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId) as! PostCell
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func getPosts() {
        // Network.getPosts(withQuery: artist)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
