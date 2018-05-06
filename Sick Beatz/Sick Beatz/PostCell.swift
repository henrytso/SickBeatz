//
//  PostCell.swift
//  Sick Beatz
//
//  Created by Henry on 5/5/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    var nameLabel: UILabel!
    var userPfp: UIImageView!
    var content: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
