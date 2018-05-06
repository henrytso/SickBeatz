//
//  MyMusicController.swift
//  Sick Beatz
//
//  Created by Henry on 4/28/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit
import SnapKit

// Unsure if it is good design to have this VC be both search and tableview
class MyMusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var searchController: UISearchController!
    var searchBar: UISearchBar!
    
    var songs: [Song] = []
    
    var tableview: UITableView!
    let reuseId = "reusableSongCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Music"
        view.backgroundColor = .black
        
        tableview = UITableView()
        tableview.bounces = true
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(SongCell.self, forCellReuseIdentifier: reuseId)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableview)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        tableview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: reuseId) as! SongCell
        
        cell.setup(with: songs[indexPath.row])
        cell.setNeedsUpdateConstraints()
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
