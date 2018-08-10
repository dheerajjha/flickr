//
//  MainViewController.swift
//  Flickr
//
//  Created by Dheeraj Jha on 26/07/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//

import UIKit

typealias Completion = (_ response: Any,_ error: Error?) -> Void

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    //    var cacheImage = [UIImage?](repeating: nil, count: 100)
    var pageNo = 1
    var searchText:String = ""
    var name: String = "MainViewController"
    var resultsArray: [photo] = [photo]()
    var itemsPerRow: CGFloat = 1
    var sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
