//
//  ImageDownloader.swift
//  Flickr
//
//  Created by Dheeraj Jha on 02/08/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloader: DataDownloaderBase{
    
    
    typealias CompletionPhoto = (_ response: UIImage? , _ error: Error?, _ urlTriggeredForDownload: String) -> Void
    
    static func getIndividualPhotosFromString(url: String, completion: @escaping CompletionPhoto){
        if let imageCached = PhotosCacheManager.getFromCache(urlString: url) {
            completion(imageCached,nil,url)
        }
        DispatchQueue.global(qos: .background).async{
            guard let urlDownload = URL(string: url)
                else {return}
            getDataFromUrl(url: urlDownload) {  data, response, error in
                guard let data = data, error == nil else { return }
                PhotosCacheManager.addToCache(urlString: url, imageObject: UIImage(data:data))
                completion(UIImage(data: data),error, url)
            }
        }
    }
    
    
}
