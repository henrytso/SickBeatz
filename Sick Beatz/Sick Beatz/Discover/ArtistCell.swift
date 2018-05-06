//
//  ArtistCell.swift
//  Sick Beatz
//
//  Created by Henry on 5/1/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit
import SnapKit

class ArtistCell: UICollectionViewCell {
    
    var nameLabel: UILabel!
    var imageBox: UIImageView!
    var spotifyURI: String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nameLabel = UILabel()
        nameLabel.font = UIFont(name: "Helvetica Neue", size: 16)
        nameLabel.backgroundColor = .clear
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageBox = UIImageView()
        imageBox.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(imageBox)
    }
    
    override func updateConstraints() {
        imageBox.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
        super.updateConstraints()
    }
    
    func setup(with artist: Artist) {
        nameLabel.text = artist.name
        imageBox.image = artist.picture
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
