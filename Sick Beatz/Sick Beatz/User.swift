//
//  User.swift
//  Sick Beatz
//
//  Created by Henry on 5/5/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    var name: String!
    var pfp: UIImage!
    
    init(name: String) {
        self.name = name
        self.pfp = UIImage(named: "person")
    }
    
    init(name: String, pfp: UIImage) {
        self.name = name
        self.pfp = pfp
    }
    
}
