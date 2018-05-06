//
//  DiscoverViewController.swift
//  Sick Beatz
//
//  Created by Henry on 4/28/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit
import SnapKit

class DiscoverViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView!
    let reuseId = "reusableArtistCell"
    
    var artists: [Artist] = []
    var genres: [Genre] = []
    
    // populate artists upon tapping the Discover tab
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Discover"
        view.backgroundColor = .white
        
        artists.append(Artist(name: "Eminem", followers: 650))
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.bounces = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ArtistCell.self, forCellWithReuseIdentifier: reuseId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        
        setupConstraints()
    }

    func setupConstraints() {
        collectionView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! ArtistCell
        
        cell.setup(with: artists[indexPath.item])
        cell.backgroundColor = .blue
        cell.setNeedsUpdateConstraints()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let artistVC = ArtistViewController()
        
        navigationController?.pushViewController(artistVC, animated: true)
        
        collectionView.deselectItem(at: indexPath, animated: true)
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
