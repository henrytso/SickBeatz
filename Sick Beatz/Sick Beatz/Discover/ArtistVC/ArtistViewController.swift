//
//  ArtistViewController.swift
//  Sick Beatz
//
//  Created by Henry on 5/1/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit
import SnapKit

class ArtistViewController: UIViewController, ArtistTabBarDelegate {

    var mainImageBox: UIImageView!
    
    var heartButton: UIButton!
    var nameLabel: UILabel!
    var followersLabel: UILabel!
    
    var tabBar: ArtistTabBar!
    
    var bioView: BioView!
    var tracksView: TracksView!
    var postsView: PostsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        mainImageBox = UIImageView()
        mainImageBox.tintColor = .gray
        mainImageBox.layer.borderWidth = 8
        mainImageBox.translatesAutoresizingMaskIntoConstraints = false
        
        heartButton = UIButton()
        // default empty heart for testing
        heartButton.imageView?.image = UIImage(named: "Heart (Empty)")
//        refreshHeartButton()
        heartButton.addTarget(self, action: #selector(heartButtonPressed), for: .touchUpInside)
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = UIFont(name: "Open Sans Regular", size: 40)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        followersLabel = UILabel()
        followersLabel.textColor = .black
        followersLabel.font = UIFont(name: "Open Sans Regular", size: 16)
        followersLabel.translatesAutoresizingMaskIntoConstraints = false
        
        tabBar = ArtistTabBar()
        tabBar.delegate = self
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainImageBox)
        view.addSubview(nameLabel)
        view.addSubview(followersLabel)
        view.addSubview(tabBar)
        
        bioView = BioView()
        bioView.artist = "eminem" // placeholder
        bioView.backgroundColor = .red
        bioView.isHidden = false
        bioView.translatesAutoresizingMaskIntoConstraints = false
        
        tracksView = TracksView()
        tracksView.artist = "eminem" // placeholder
        tracksView.backgroundColor = .green
        tracksView.isHidden = true
        tracksView.translatesAutoresizingMaskIntoConstraints = false
        
        postsView = PostsView()
        postsView.artist = "eminem" // placeholder
        postsView.backgroundColor = .blue
        postsView.isHidden = true
        postsView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bioView)
        view.addSubview(tracksView)
        view.addSubview(postsView)
        
        setupConstraints()
    }

    func setupConstraints() {
        let side = UIScreen.main.bounds.width/2.5
        
        // navbar is 64, contentInset later
        
        mainImageBox.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(96)
            make.leading.equalToSuperview().offset(32)
            make.width.equalTo(side)
            make.height.equalTo(side)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageBox.snp.top).offset(8)
            make.leading.equalTo(mainImageBox.snp.trailing).offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalTo(mainImageBox.snp.centerY).offset(-8)
        }
        
        followersLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageBox.snp.centerY).offset(8)
            make.leading.equalTo(nameLabel.snp.leading)
            make.trailing.equalTo(nameLabel.snp.trailing).offset(-32)
            make.height.equalTo(followersLabel.intrinsicContentSize.height)
        }
        
        heartButton.snp.makeConstraints { make in
            make.top.equalTo(followersLabel)
            make.bottom.equalTo(followersLabel)
            make.leading.equalTo(followersLabel.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
        }
        
        tabBar.snp.makeConstraints { make in
            make.top.equalTo(mainImageBox.snp.bottom)
            make.bottom.equalTo(mainImageBox.snp.bottom).offset(72)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview()
        }
        
        bioView.snp.makeConstraints { make in
            make.top.equalTo(tabBar.snp.bottom).offset(4)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        tracksView.snp.makeConstraints { make in
            make.edges.equalTo(bioView)
        }
        
        postsView.snp.makeConstraints { make in
            make.edges.equalTo(bioView)
        }
    }
    
    func tabPressed(tabName: String) {
        
        DispatchQueue.main.async {
            switch tabName {
            case "Bio":
                self.tracksView.isHidden = true
                self.postsView.isHidden = true
                self.bioView.isHidden = false
                self.view.bringSubview(toFront: self.bioView)
            case "Tracks":
                self.bioView.isHidden = true
                self.postsView.isHidden = true
                self.tracksView.isHidden = false
                self.view.bringSubview(toFront: self.tracksView)
            case "Posts":
                self.bioView.isHidden = true
                self.tracksView.isHidden = true
                self.postsView.isHidden = false
                self.view.bringSubview(toFront: self.postsView)
            default:
                break;
            }
        }
        
        self.view.layoutSubviews()
        
    }
    
    @objc func heartButtonPressed(sender: UIButton!) {
        if (heartButton.currentImage == UIImage(named: "Heart (Empty)")) {
            heartButton.imageView?.image = UIImage(named: "Heart (filled)")
        } else {
            heartButton.imageView?.image = UIImage(named: "Heart (Empty)")
        }
//        refreshHeartButton()
    }
    
//    func refreshHeartButton() {
//        // ask backend if liked
//        let artistName = nameLabel.text
//        Network.getArtists(withQuery: "henry") { artistsArray in
//            for artist in artistsArray {
//                if artist.name == artistName {
//                    self.heartButton.imageView?.image = UIImage(named: "Heart (filled)")
//                    return
//                }
//            }
//            self.heartButton.imageView?.image = UIImage(named: "Heart (Empty)")
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
