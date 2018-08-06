//
//  EndPoint.swift
//  Flickr
//
//  Created by Dheeraj Jha on 27/07/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//
//
//let id:String?
//let owner:String?
//let secret:String?
//let server:String?
//let farm:String?
//let title:String?
//let isPublic:Bool = false
//let isFriend:Bool = false
//let isFamily:Bool = false
//let url:String?
//let localStorage:String?

import Foundation
import UIKit

class DataDownloaderBase{
    
    static func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
}

