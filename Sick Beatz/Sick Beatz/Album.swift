//
//  Album.swift
//  Sick Beatz
//
//  Created by Henry on 5/5/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class Album {
    
    var title: String!
    var artists: [String]!
    var image: UIImage!
    var albumID: String!
    var artistIDs: [String: String]!
    
    
    
    init(title: String, artists: [String], artistIDs: [String: String], imageURL: URL, albumID: String) {
        self.title = title
        self.artists = artists
        self.artistIDs = artistIDs
        self.image = UIImage(data: try! Data(contentsOf: imageURL))
        self.albumID = albumID
    }
}

