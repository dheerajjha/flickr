//
//  File.swift
//  Flickr
//
//  Created by Dheeraj Jha on 03/08/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//

import Foundation
import UIKit

class CacheManager{
    private static var urlMapped:[String?] = []
    private static var mapTable = NSMapTable<NSString, UIImage>(keyOptions: .strongMemory, valueOptions: .weakMemory)
    private static var countOfPhotosToCache = Constants.countOfPhotosToCache
    
    static func addToCache(urlString: String?, imageObject: UIImage?){
        if urlString != nil, imageObject != nil {
            mapTable.setObject(imageObject, forKey: urlString! as NSString)
            urlMapped.append(urlString!)
            DispatchQueue.global(qos: .background).async{
                overflowCheck()
            }
        }
        
    }

    static func getFromCache(urlString: String?) -> UIImage?{
        if urlString != nil{
            return mapTable.object(forKey: (urlString! as NSString))
        }
    return nil
    }
    
    private static func overflowCheck(){
        if(urlMapped.count>200){
                mapTable.removeObject(forKey: urlMapped[0]! as NSString)
                urlMapped.remove(at: 0)
            
        }
    }
    


}
