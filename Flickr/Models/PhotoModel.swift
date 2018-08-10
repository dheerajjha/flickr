//
//  PhotoModel.swift
//  Flickr
//
//  Created by Dheeraj Jha on 25/07/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//
import Foundation

struct photo: Codable{
    let id: String
    let owner:  String
    let secret: String
    let server: String
    let farm:   Int
    let title:  String
    let ispublic:   Int
    let isfriend:   Int
    let isfamily:   Int
    
    var downloadURL: String? = nil
    public mutating func getDownloadURL() -> String {
        if let imageURL = self.downloadURL {
            return imageURL
        } else {
            let url = StringGenerateUtility.generateIndividualPhotosURL(farm: self.farm, server: self.server, id: self.id, secret: self.secret)
            downloadURL = url
            return url
        }
    }
}
struct photos: Codable{
    let page:   Int
    let pages:  Int
    let perpage:Int
    let total:  String
    var photo:  [photo]
}
struct photoModel: Codable{
    let photos: photos
    let stat:   String
}
////Understand Generics in swift
//struct Page<T: Codable>: Codable{
//    let page:   Int
//    let pages:  Int
//    let perpage:Int
//    let total:  String
//    var photo:  [T]
//}
//
//
//struct photoModel: Codable{
//    let photos: Page<photo>
//    let stat:   String
//
//}
//
//
