//
//  ViewController.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/13/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import UIKit

let fakeData: [String : Any] = ["name" : "Ross",
                "age" : 20,
                "gender" : 0,
                "hobbies" : "nothing great"]

class MainViewController: UIViewController {

    var mainView: MainViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mainView = MainViewModel(frame: self.view.frame)
        self.view.addSubview(mainView)
        
//        for _ in 0...10 {
//            
//            let user = UserProfile(id: Int(arc4random()), data: fakeData)
//            
//            FirebaseAPI.addProfile(profile: user)
//            
//            
//        }
        
        
        
        FirebaseAPI.streamList { (data) in
            
            if data != nil {
                
                DataOrganizer.shared.storeProfiles(with: data!)
                
                DispatchQueue.main.async {
                    
                    mainView.tableView.reloadData()
                    
                }
                
            }
            
            
            
            
        }
    }



    


}

