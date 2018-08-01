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

class DownloadManager{
    
    
//
//    var photoModel = PhotoModel(id: "result", owner: "agf", secret: <#String?#>, server: <#String?#>, farm: <#String?#>, title: <#String?#>, url: "hi", localStorage: <#String?#>)
//
    static var count:Int = 0
    
    
    static func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }

    static func downloadImage(url: URL, imageView: UIImageView?) -> UIImage? {
        print("Download Started")
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished image no. \(count)")
            count += 1
            
            DispatchQueue.main.async() {
                imageView?.image = UIImage(data: data)
                
            }
        }
        print(Constants.URLConstants.fullUrlConstruct(searchText: "kittens"))
        return imageView?.image
    }
    
    static func searchTextPhotosObjectArray(textToSearch: String) -> photoModel {
        
        if let url: URL = URL(string: Constants.URLConstants.fullUrlConstruct(searchText: textToSearch)){
            getDataFromUrl(url: url) {
                data, response, error in
            guard let data = data, error == nil else { return }
                //logic
                
                DispatchQueue.main.async() {
                    
                
            }
        }
        }
    return photoModel
}
}

