//
//  Artist.swift
//  Sick Beatz
//
//  Created by Henry on 5/1/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class Artist {
    
    var name: String!
    var followers: Int!
    var picture: UIImage!
    
    init(name: String, followers: Int) {
        self.name = name
        self.followers = followers
        self.picture = UIImage(named: "pfp")
    }
    
    init(from json: JSON) {
        self.name = json["name"].stringValue
        self.followers = json["followers"].intValue
        self.picture = UIImage(named: "pfp")
    }
    
}
