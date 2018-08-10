//
//  CollectionViewController.swift
//  Flickr
//
//  Created by Dheeraj Jha on 26/07/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//

import UIKit

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if resultsArray.count - 11 == indexPath.row {
            pageNo = pageNo + 1
            APIDownloader.searchTextPhotosObjectArray(textToSearch: searchText, pageNo: pageNo){
                (data, error) in
                self.resultsArray.append(contentsOf: data.photos.photo)
                    DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("didEndDisplaying")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CustomCollectionViewCell
        let item = resultsArray[indexPath.row]
        
        cell?.configureCell(photoObject: item)
        
//        if indexPath.row < urlList.count, let url = URL(string: urlList[indexPath.row]!) {
//        cell?.imageView.image = DownloadManager.downloadImage(url: url, imageView: cell?.imageView)
//        }
        return cell ?? UICollectionViewCell()
    }
    
    //not used
    func collectionView(_: UICollectionView, didHighlightItemAt: IndexPath) {
        print(didHighlightItemAt)
    }
    
    
    
    
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    
}
