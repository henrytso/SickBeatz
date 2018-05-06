//
//  GenreCell.swift
//  
//
//  Created by Henry on 5/5/18.
//

import UIKit

class GenreCell: UICollectionViewCell {
    
    var genreLabel: UILabel!
    var imageBox: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        genreLabel = UILabel()
        genreLabel.font = UIFont(name: "Helvetica Neue", size: 56)
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageBox = UIImageView()
        imageBox.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(genreLabel)
        contentView.addSubview(imageBox)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
