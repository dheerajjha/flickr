//
//  StringGenerateUtility.swift
//  Flickr
//
//  Created by Dheeraj Jha on 02/08/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//

import Foundation

class StringGenerateUtility{
    
    static func generateIndividualPhotosURL(farm: Int, server: String, id: String, secret: String) -> String{
        return "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
    }
    
    //Use final fullUrlConstruct to generate url using search text
    static func fullUrlConstruct(searchText: String, pageNo: Int) -> String{
        return Constants.URLConstants.baseUrl + "&text=\(searchText)" + "&page=\(pageNo)"
    }
    
}
