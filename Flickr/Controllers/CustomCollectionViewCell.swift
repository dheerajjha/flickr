//
//  CollectionViewCell.swift
//  Flickr
//
//  Created by Dheeraj Jha on 26/07/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    var photoObject: photo?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoObject = nil
        imageView.image = #imageLiteral(resourceName: "first")
    }
    
    func configureCell( photoObject: photo) {
        var mutatingObj = photoObject
        self.photoObject = mutatingObj
        self.imageView.image = #imageLiteral(resourceName: "first")
        let aimURL = mutatingObj.getDownloadURL()
            ImageDownloader.getIndividualPhotosFromString(url: aimURL){ [weak self] image, error, returnedDownloadURL in
                guard let strongSelf = self else { return }
                DispatchQueue.main.async {
                    if strongSelf.photoObject?.getDownloadURL() == returnedDownloadURL{
                        strongSelf.imageView.image = image
                        
                    }
                }
            }
    }
    
    
}


