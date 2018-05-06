//
//  Network.swift
//  Sick Beatz
//
//  Created by Henry on 4/28/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


//Network.getSongs(query: "") { songs in
// self.masterSongs = songs
//self.tableView.rel//
//}

class Network {
    
//    private static let endpoint = "http://35.199.16.18:5000"
    private static let endpoint = "localhost:8000"
    private static let endpoint0 = "https://accounts.spotify.com/api/token"
    private static let endpoint1 = "https://api.spotify.com/v1/browse/new-releases"
    private static let endpoint2 = "https://api.spotify.com/v1/albums/{id}/tracks"
    private static let endpoint3 = "https://api.spotify.com/v1/tracks/{id}"
    
    static func getNewReleasesAlbums(completion: @escaping ([Album]) -> Void) {
        var authCode = String()
        var albumsArray = [Album]()
        let client_credentials = "client_credentials"
        let clientidsecret = Data(("a2106f1ee5754149a8c974176fef027b" + ":" + "5c1d25122c3e4f159f07eab05b49239a").utf8).base64EncodedString()
        var authHeader = [
            "Authorization" : "Basic " + clientidsecret
        ]
        
        let bodyParameters = [
            "grant_type" : client_credentials
        ]
        
        Alamofire.request("https://accounts.spotify.com/api/token", method: HTTPMethod.post, parameters: bodyParameters, encoding: URLEncoding.httpBody, headers: authHeader).validate().responseJSON {(response) in
            
            let responseJSON = try? JSONSerialization.jsonObject(with: response.data!, options: []) as! [String : Any]
            //print(response)
            authCode = (responseJSON!["access_token"] as! String)
            //print(authCode)
            
            let parameters: Parameters = [
                "country" : "US",
                "limit" : 10,
                "offset" : 0
            ]
            
            authHeader = ["Authorization" : ("Bearer " + authCode)]
            Alamofire.request("https://api.spotify.com/v1/browse/new-releases", method: .get, parameters: parameters, headers: authHeader).validate().responseJSON {(response) in
                //print(response)
                
                let responseJSON = try? JSONSerialization.jsonObject(with: response.data!, options: []) as! [String : AnyObject]
                if let albums = responseJSON!["albums"] as? [String : AnyObject] {
                    if let items = albums["items"] as? [AnyObject] {
                        for i in 0..<items.count { // ...begin iterating through each album
                            let item = items[i] as! [String :  AnyObject]
                            
                            var artistsSong = [String]()
                            var artistsSongIDs = [String: String]()
                            
                            let artists = item["artists"] as! [AnyObject]
                            for i in 0..<artists.count {
                                let artist = artists[i] as! [String : AnyObject]
                                artistsSong.append(artist["name"] as! String)
                                artistsSongIDs[artist["name"] as! String] = artist["id"] as? String
                            }
                            
                            
                            let albumTitle = item["name"] as! String
                            let imageURL = item["url"] as! URL
                            let id = item["id"] as! String
                            
                            albumsArray.append(Album(title: albumTitle, artists: artistsSong, artistIDs: artistsSongIDs, imageURL: imageURL, albumID: id))
                        }
                    }
                }
            }
            completion(albumsArray)
        }
        
    }
    
    static func getNewReleasesSongs(completion: @escaping ([Song]) -> Void) {
        var receivedAlbumsArray = [Album]()
        getNewReleasesAlbums(){ albumsArray in
            receivedAlbumsArray = albumsArray
        }
        
        var songsArray = [Song]()
        
        var authCode = String()
        let client_credentials = "client_credentials"
        let clientidsecret = Data(("a2106f1ee5754149a8c974176fef027b" + ":" + "5c1d25122c3e4f159f07eab05b49239a").utf8).base64EncodedString()
        var authHeader = [
            "Authorization" : "Basic " + clientidsecret
        ]
        
        let bodyParameters = [
            "grant_type" : client_credentials
        ]
        
        Alamofire.request("https://accounts.spotify.com/api/token", method: HTTPMethod.post, parameters: bodyParameters, encoding: URLEncoding.httpBody, headers: authHeader).validate().responseJSON {(response) in
            
            let responseJSON = try? JSONSerialization.jsonObject(with: response.data!, options: []) as! [String : Any]
            //print(response)
            authCode = (responseJSON!["access_token"] as! String)
            //print(authCode)
            
            authHeader = ["Authorization" : ("Bearer " + authCode)]
            
            for i in 0..<receivedAlbumsArray.count { // ...begin iterating through the array of newly released albums
                let currentAlbum = receivedAlbumsArray[i]
                let parameters: Parameters = [
                    "id" : currentAlbum.albumID
                ]
                Alamofire.request("https://api.spotify.com/v1/albums/{id}/tracks", method: .get, parameters: parameters, encoding: URLEncoding.httpBody, headers: authHeader).validate().responseJSON {(response) in
                    
                    let responseJSON = try? JSONSerialization.jsonObject(with: response.data!, options: []) as! [String : AnyObject]
                    if let items = responseJSON!["items"] as? [AnyObject] {
                        
                        // accessing song 0
                        
                        let item = items[0] as! [String : AnyObject]
                        let songTitle = item["name"] as? String
                        
                        var artistsSong = [String]() // a list of the track's artists
                        var artistsSongIDs = [String : String]() // dictionary of artist name : artist ID
                        
                        let artists = item["artists"] as! [AnyObject]
                        for i in 0..<artists.count {
                            let artist = artists[i] as! [String : AnyObject]
                            artistsSong.append(artist["name"] as! String)
                            artistsSongIDs[artist["name"] as! String] = artist["id"] as? String
                        }
                        
                        let songID = item["id"] as? String
                        let albumTitle = currentAlbum.title
                        let songImage = currentAlbum.image
                        let songPreviewURL = item["preview_url"] as? URL // we ask for preview URL under this function, and we will check for the preview URL again when we request for the song via songID whenever play button is pressed
                        
                        songsArray.append(Song(title: songTitle!, artists: artistsSong, artistIDs: artistsSongIDs, album: albumTitle!, image: songImage!, id: songID!, previewURL: songPreviewURL!))
                        
                    }
                }
            } // ... done iterating through the array of newly released albums
            
            completion(songsArray)   // not sure if songsArray here is empty
        }
        
    }
    
    static func getSongs(withQuery songIDs: [String], completion: @escaping ([Song]) -> Void) {
        var authCode = String()
        var songsArray = [Song]()
        let client_credentials = "client_credentials"
        let clientidsecret = Data(("a2106f1ee5754149a8c974176fef027b" + ":" + "5c1d25122c3e4f159f07eab05b49239a").utf8).base64EncodedString()
        var authHeader = [
            "Authorization" : "Basic " + clientidsecret
        ]
        
        let bodyParameters = [
            "grant_type" : client_credentials
        ]
        
        Alamofire.request("https://accounts.spotify.com/api/token", method: HTTPMethod.post, parameters: bodyParameters, encoding: URLEncoding.httpBody, headers: authHeader).validate().responseJSON {(response) in
            
            let responseJSON = try? JSONSerialization.jsonObject(with: response.data!, options: []) as! [String : Any]
            //print(response)
            authCode = (responseJSON!["access_token"] as! String)
            //print(authCode)
            
            for i in 0..<songIDs.count{ //...begin iterating through each of the songIDs
                let parameters: Parameters = [
                    "id" : songIDs[i]
                ]
                authHeader = ["Authorization" : ("Bearer " + authCode)]
                
                Alamofire.request("https://api.spotify.com/v1/tracks/{id}", method: .get, parameters: parameters, encoding: URLEncoding.httpBody, headers: authHeader).validate().responseJSON {(response) in
                    
                    let responseJSON = try? JSONSerialization.jsonObject(with: response.data!, options: []) as! [String : AnyObject]
                    
                    let songID = responseJSON!["id"] as! String
                    let songName = responseJSON!["name"] as! String
                    var songAlbum = String()
                    var albumImg = UIImage()
                    var artistsNames = [String]()
                    var artistsIDs = [String : String]()
                    let songPreviewURL = responseJSON!["preview_url"] as? URL
                    
                    if let album = responseJSON!["album"] as? [String : AnyObject] {
                        songAlbum = album["name"] as! String
                        
                        if let images = album["images"] as? [AnyObject]{
                            let image = images[0] as? [String : AnyObject]
                            do {
                                let imageData = try Data(contentsOf: image!["url"] as! URL)
                                albumImg = UIImage(data: imageData)!
                            }
                            catch {
                                albumImg = UIImage(named: "defaultAlbumCover")!
                            }
                        }
                        
                    }
                    
                    if let artists = responseJSON!["artists"] as? [AnyObject]{
                        for i in 0..<artists.count {
                            let artist = artists[i] as! [String : AnyObject]
                            artistsNames.append(artist["name"] as! String)
                            artistsIDs[artist["name"] as! String] = artist["id"] as? String
                        }
                        
                    }
                    
                    songsArray.append(Song(title: songName, artists: artistsNames, artistIDs: artistsIDs, album: songAlbum, image: albumImg, id: songID, previewURL: songPreviewURL!))
                } // ...done iterating through each of the songIDs
            }
            
            completion(songsArray)
        }
    }
    
    static func getSongIDs(withQuery userID: String, completion: @escaping ([String]) -> Void) {
        
    }
    
    static func getSongs(withQuery query: String, completion: @escaping ([Song]) -> Void) {
        
        let parameters: Parameters = [
            "user_id" : query
        ]
        
        Alamofire.request(endpoint, method: .get, parameters: parameters)
            .validate().responseJSON { response in
                switch response.result {
                case .success(let data):
                    let dataJSON = JSON(data)
                    var songArray = [Song]()
                    if let songJSONArray = dataJSON["songs"].array {
                        for songJSON in songJSONArray {
                            songArray.append(Song(from: songJSON))
                        }
                    }
                    completion(songArray)
                case .failure(let error):
                    print(error.localizedDescription)
            }
            
        }
    }
    
    // user to artist
    static func sendLike(withQuery query: String, completion: @escaping (Bool) -> Void) {
        let queryArray = query.split(separator: ",")
        let parameters: Parameters = [
            "user_name" : queryArray[0],
            "artist_name" : queryArray[1],
            "artist_genre" : queryArray[2]
        ]
        
        Alamofire.request(endpoint, method: .get, parameters: parameters)
            .validate().responseJSON { response in
                switch response.result {
                case .success(let data):
                    let dataJSON = JSON(data)
                    if (dataJSON["result"].stringValue == "true") {
                        completion(true)
                    } else {
                        completion(false)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
        
    }
    
    static func deleteLike(withQuery query: String, completion: @escaping (Bool) -> Void) {
        
        let queryArray = query.split(separator: ",")
        let parameters: Parameters = [
            "u_id" : queryArray[0],
            "a_id" : queryArray[1]
        ]
        
        Alamofire.request(endpoint, method: .delete, parameters: parameters)
            .validate().responseJSON { response in
                switch response.result {
                case .success(let data):
                    let dataJSON = JSON(data)
                    if (dataJSON["result"].stringValue == "true") {
                        completion(true)
                    } else {
                        completion(false)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
        
    }
    
    static func getArtists(withQuery query: String, completion: @escaping ([Artist]) -> Void) {
        let parameters: Parameters = [
            "user" : query
        ]
        
        Alamofire.request(endpoint, method: .get, parameters: parameters)
            .validate().responseJSON { response in
                switch response.result {
                case .success(let data):
                    let dataJSON = JSON(data)
                    var artistsArray: [Artist] = []
                    for artistDict in dataJSON["artists"].arrayValue {
                        artistsArray.append(Artist(from: artistDict))
                    }
                    completion(artistsArray)
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
        }
    }
}
