//
//  TracksView.swift
//  Sick Beatz
//
//  Created by Henry on 5/5/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit

class TracksView: UIView, UITableViewDataSource, UITableViewDelegate {

    var artist: String!
    
    var tableView: UITableView!
    let reuseId = "reusableSongCell"
    
    var songs: [Song] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView = UITableView()
        tableView.bounces = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(SongCell.self, forCellReuseIdentifier: reuseId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(tableView)
        
        setupConstraints()
        
        getSongs()
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId) as! SongCell
        
        cell.setup(with: songs[indexPath.row])
        cell.setNeedsUpdateConstraints()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func getSongs() {
//        Network.getSongs(withQuery: artist) { songsArray in
//            self.songs = songsArray
//            self.tableView.reloadData()
//        }
        var hardCoded: [Song] = []
        
        // this song is rly beautiful u should give it a listen!
        hardCoded.append(Song(title: "Time to Love", artist: "October", album: "idk", image: UIImage(named: "person")!, url: URL(fileURLWithPath: "url")))
        
        // this one will make ur head hurt in the best way possible
        hardCoded.append(Song(title: "Bangarang", artist: "Skrillex", album: "idk", image: UIImage(named: "person")!, url: URL(fileURLWithPath: "url")))
        
        self.songs = hardCoded
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
