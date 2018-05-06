//
//  ArtistTabBarCell.swift
//  Sick Beatz
//
//  Created by Henry on 5/1/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit
import SnapKit

class ArtistTabBarCell: UICollectionViewCell {
    
    var nameLabel: UILabel!
    
    var underline: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = UIFont(name: "Helvetica Neue", size: 24)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        underline = UIView()
        underline.backgroundColor = .orange
        underline.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(underline)
    }
    
    override func updateConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        underline.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.bottom).offset(-4)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview()
        }
        
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
