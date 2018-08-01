//
//  CollectionViewController.swift
//  Flickr
//
//  Created by Dheeraj Jha on 26/07/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//

import UIKit

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CustomCollectionViewCell
        if let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/f/f0/%27Matijevic_Hill%27_Panorama_for_Rover%27s_Ninth_Anniversary_%28Stereo%29.jpg") {
        cell?.imageView.image = DownloadManager.downloadImage(url: url, imageView: cell?.imageView)
        }
        return cell ?? UICollectionViewCell()
    
    
}
}
