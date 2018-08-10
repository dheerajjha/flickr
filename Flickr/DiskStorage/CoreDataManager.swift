//
//  CoreDataManager.swift
//  Flickr
//
//  Created by Dheeraj Jha on 09/08/18.
//  Copyright © 2018 PhonePe. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager{
    
    static func getSearchHistory() -> [NSManagedObject] {
        var list = [NSManagedObject]()
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {return []}
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "SearchList")
        do {
            list = try managedContext.fetch(fetchRequest)
            }
        catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return list
    }
    
    static func saveSearchText(textToSave: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        DispatchQueue.global().async {
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "SearchList", in: managedContext)!
        let searchList = NSManagedObject(entity: entity, insertInto: managedContext)
    
        searchList.setValue(textToSave, forKeyPath: "searchText")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error)")
        }
    }
}
}
