//
//  PhotosCacheManager.swift
//  Flickr
//
//  Created by Dheeraj Jha on 06/08/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//

import Foundation
import UIKit

class PhotosCacheManager {
    private static var imageCache = NSCache<NSString, UIImage>()
    
    static func getFromCache(urlString: String?) -> UIImage?{
        if urlString != nil, let imageCached = imageCache.object(forKey: urlString! as NSString) {
            return imageCached
        }
        
        return nil
    }
    
    static func addToCache(urlString: String?, imageObject: UIImage?){
        
        if urlString != nil, imageObject != nil {
            imageCache.setObject(imageObject!, forKey: urlString! as NSString)
        }
    }
}
