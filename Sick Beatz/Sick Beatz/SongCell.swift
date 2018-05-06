//
//  SongCell.swift
//  Sick Beatz
//
//  Created by Henry on 4/28/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit
import SwiftyJSON

class SongCell: UITableViewCell {

    var titleLabel: UILabel!
    var artistLabel: UILabel!
    var albumLabel: UILabel!
    var imageBox: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .black
        
        // TODO: Look into fonts that are more SICK
        
        titleLabel = UILabel()
        titleLabel.font = UIFont(name: "Helvetica Neue", size: 22)
        titleLabel.textColor = .lightText
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        artistLabel = UILabel()
        artistLabel.font = UIFont(name: "Helvetica Neue", size: 16)
        artistLabel.textColor = .lightText
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        
        albumLabel = UILabel()
        albumLabel.font = UIFont(name: "Helvetica Neue", size: 16)
        albumLabel.textColor = .lightText
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageBox = UIImageView()
        imageBox.layer.cornerRadius = 20
        imageBox.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(artistLabel)
        contentView.addSubview(albumLabel)
        contentView.addSubview(imageBox)
        
    }
    
    // TODO: Convert to SnapKit syntax for better readability
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            imageBox.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            imageBox.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            imageBox.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -76),
            imageBox.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: imageBox.leadingAnchor, constant: -16)
            ])
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            artistLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            artistLabel.trailingAnchor.constraint(equalTo: imageBox.leadingAnchor, constant: -16)
            ])
        
        NSLayoutConstraint.activate([
            albumLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            albumLabel.leadingAnchor.constraint(equalTo: artistLabel.trailingAnchor, constant: 4),
            albumLabel.trailingAnchor.constraint(equalTo: imageBox.leadingAnchor, constant: -16)
            ])
        
        super.updateConstraints()
    }
    
    func setup(with song: Song) {
        titleLabel.text = song.title
        artistLabel.text = song.artist
        albumLabel.text = song.album
        imageBox.image = song.image
        contentView.backgroundColor = .white
    }
    
    func setup(with json: JSON) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
