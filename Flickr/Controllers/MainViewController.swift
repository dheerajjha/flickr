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
    
    var name: String = "MainViewController"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DispatchQueue.global(qos: .background).async {
            
            self.asynHeaveyTask {[weak self](response, error) in
                guard let theSelf = self else { return }
                theSelf.name = "xyz"
                print("heavy oper complt")
                
            }
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func asynHeaveyTask(completion: Completion) {
        
        sleep(10)
        
        completion("Done", nil)
    }
    

}
