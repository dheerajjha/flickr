//
//  PhotoModel.swift
//  Flickr
//
//  Created by Dheeraj Jha on 25/07/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//

import Foundation

struct PhotoModel {
    let id:String?
    let owner:String?
    let secret:String?
    let server:String?
    let farm:String?
    let title:String?
    let isPublic:Bool = false
    let isFriend:Bool = false
    let isFamily:Bool = false
    let url:String?
    let localStorage:String?
}
