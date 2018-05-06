//
//  Post.swift
//  Sick Beatz
//
//  Created by Henry on 5/5/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class Post {
    
    var user: User!
    
    var content: String!
    
    init(user: User, content: String) {
        self.user = user
        self.content = content
    }
    
    init(from json: JSON) {
        self.user = User(name: json["name"].stringValue)
        self.content = json["content"].stringValue
    }
    
}
