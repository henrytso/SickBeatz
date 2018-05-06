//
//  ArtistTabBar.swift
//  Sick Beatz
//
//  Created by Henry on 5/1/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit

protocol ArtistTabBarDelegate {
    func tabPressed(tabName: String)
}

class ArtistTabBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    let reuseId = "reusableCollectionViewCell"
    
    var tabNames: [String] = []
    
    var delegate: ArtistTabBarDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        tabNames.append("Bio")
        tabNames.append("Tracks")
        tabNames.append("Posts")
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ArtistTabBarCell.self, forCellWithReuseIdentifier: reuseId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! ArtistTabBarCell
        
        cell.nameLabel.text = tabNames[indexPath.item]
        cell.setNeedsUpdateConstraints()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let x = UILabel()
        x.text = tabNames[indexPath.item]
        let w = x.intrinsicContentSize.width
        return CGSize(width: w + 48, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = tabNames[indexPath.item]
        delegate.tabPressed(tabName: name)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
