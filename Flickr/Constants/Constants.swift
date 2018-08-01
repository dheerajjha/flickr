//
//  Constants.swift
//  Flickr
//
//  Created by Dheeraj Jha on 31/07/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//

import Foundation
public class Constants{
    //private
    static private let apiKey:String = "f2ddfcba0e5f88c2568d96dcccd09602"
    enum format: String {
        case json
        case xml
    }
    enum method: String {
        case photosSearch = "flickr.photos.search"
        case other = ""
    }
    struct URLConstants{
        static let baseUrl = "https://api.flickr.com/services/rest/?method=\(method.photosSearch.rawValue)&api_key=\(apiKey)&format=\(format.json)&nojsoncallback=1&safe_search=1"
        //Use final fullUrlConstruct to generate url using search text
        static func fullUrlConstruct(searchText: String) -> String{
        return baseUrl + "&text=\(searchText)"
        }
    }
    
    
}
