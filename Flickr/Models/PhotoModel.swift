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
    func parseJSONToPhotoModel(jsonObject: String){
        
    }
}
