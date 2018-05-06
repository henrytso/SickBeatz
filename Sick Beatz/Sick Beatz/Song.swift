//
//  Song.swift
//  Sick Beatz
//
//  Created by Henry on 4/28/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class Song {
    
    var title: String!
    var artist: String!

    var url: URL?
    
    var artists: [String]!
    var album: String?
    var image: UIImage!
    var id: String! // songID
    var artistIDs: [String: String]!
    var previewURL: URL
    
    init(title: String, artists: [String], artistIDs: [String: String], album: String, image: UIImage, id: String, previewURL: URL) {
        self.title = title
        self.artists = artists
        self.artistIDs = artistIDs
        self.album = album
        self.image = image
        self.id = id
        self.previewURL = previewURL
    }
    
    init(title: String, artist: String, album: String, image: UIImage, url: URL) {
        self.title = title
        self.artist = artist
        self.album = album
        self.image = image
        self.url = url
        
        //placeholders, last- minute merging code
        self.id = "placeholder"
        self.artistIDs = [:]
        self.previewURL = URL(fileURLWithPath: "placeholder")
    }
    
    init(from json: JSON) {
        self.title = json["title"].stringValue
        self.artist = json["artists"].stringValue
        self.album = json["album"].stringValue
        self.image = UIImage() // can a json value be an image? should we have an imageURL?
        self.url = URL(fileURLWithPath: json["url"].stringValue)
        
        //placeholders, last- minute merging code
        self.id = "placeholder"
        self.artistIDs = [:]
        self.previewURL = URL(fileURLWithPath: "placeholder")
    }
    
}
