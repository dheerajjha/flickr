//
//  APIDownloader.swift
//  Flickr
//
//  Created by Dheeraj Jha on 02/08/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//

import Foundation

class APIDownloader: DataDownloaderBase {
    
    typealias Completion = (_ response: photoModel, _ error: Error?) -> Void
    
    static func searchTextPhotosObjectArray(textToSearch: String, pageNo: Int, completion: @escaping Completion) {
        DispatchQueue.global(qos: .background).async {
            guard let url = URL(string: StringGenerateUtility.fullUrlConstruct(searchText: textToSearch, pageNo: pageNo))
                else { return }
            getDataFromUrl(url: url) {  data, response, error in
                guard let data = data, error == nil else { return }
                do {
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(photoModel.self, from: data)
                    completion(jsonData,error)
                } catch let err {
                    print("Err", err)
                }
                
            }
        }
        
    }
    
}
