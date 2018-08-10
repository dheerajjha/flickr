//
//  SearchBarController.swift
//  Flickr
//
//  Created by Dheeraj Jha on 26/07/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//

import UIKit

extension MainViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let activityIndicator = UIActivityIndicatorView()
        searchBar.addSubview(activityIndicator)
        activityIndicator.frame = searchBar.bounds
        activityIndicator.startAnimating()
        searchText = searchBar.text!
        print("search text entered is \(searchText)")
        
        CoreDataManager.saveSearchText(textToSave: searchText)
        
        APIDownloader.searchTextPhotosObjectArray(textToSearch: searchText, pageNo: pageNo){
            (data, error) in
            self.resultsArray.removeAll()
            self.resultsArray = data.photos.photo
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                activityIndicator.stopAnimating()
            }
        }
    }
}
