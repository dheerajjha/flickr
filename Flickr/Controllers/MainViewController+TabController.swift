//
//  TabController.swift
//  Flickr
//
//  Created by Dheeraj Jha on 26/07/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//

import UIKit

extension MainViewController: UITabBarDelegate {

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        switch item.tag {
        case 0:
            print("tab 0 selected")
            self.sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
            self.itemsPerRow = 1
            self.collectionView.reloadData()
        case 1:
            print("tab 1 selected")
            self.sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
            self.itemsPerRow = 2
            self.collectionView.reloadData()
        case 2:
            print("tab 2 selected")
            self.sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
            self.itemsPerRow = 3
            self.collectionView.reloadData()
        default:
            print("I dont know what happened")
        }
        
    }
}
