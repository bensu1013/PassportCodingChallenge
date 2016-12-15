//
//  ViewController.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/13/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import UIKit

var fakeData: [String : Any] = [
                "uid" : 0,
                "name" : "Ross",
                "age" : 20,
                "gender" : 0,
                "hobbies" : "nothing great"]

class MainViewController: UIViewController {

    var mainTableView: MainTableViewModel!
    var navBar: NavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainTableViewFrame = CGRect(x: 0, y: self.view.bounds.height * 0.1, width: self.view.bounds.width, height: self.view.bounds.height * 0.9)
        mainTableView = MainTableViewModel(frame: mainTableViewFrame)
        mainTableView.delegate = self
        self.view.addSubview(mainTableView)
        
        let navFrame = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height * 0.1)
        navBar = NavigationBar(frame: navFrame)
        navBar.backgroundColor = UIColor.cyan
        self.view.addSubview(navBar)
        
//        for _ in 0...9 {
//            
//            let id = Int(arc4random())
//            
//            fakeData["uid"] = id
//            
//            let user = UserProfile(data: fakeData)
//            
//            FirebaseAPI.addProfile(profile: user)
//            
//        }
        
        FirebaseAPI.readUserList { (data) in
            
            if data != nil {
                
                DataOrganizer.shared.storeProfiles(with: data!)
                
                DispatchQueue.main.async {
                    
                    self.mainTableView.tableView.reloadData()
                    
                }
                
            }
        
        }
        
        FirebaseAPI.observeAddedProfiles { (data) in
            
            DataOrganizer.shared.addProfile(with: data)
            
            DispatchQueue.main.async {
                
                self.mainTableView.tableView.reloadData()
                
            }
            
        }
        
        FirebaseAPI.observeRemovedProfiles { (data) in
       
            DataOrganizer.shared.removeProfile(with: data)

            DispatchQueue.main.async {
                
                self.mainTableView.tableView.reloadData()
                
            }
            
        }
        
        FirebaseAPI.observeChangedProfiles { (data) in
            
            DataOrganizer.shared.editProfile(with: data)
            
            DispatchQueue.main.async {
                
                self.mainTableView.tableView.reloadData()
                
            }
            
            
        }
        
    }

    

}

extension MainViewController: MainTableViewDelegate {
    
    func segueAction() {
        
        performSegue(withIdentifier: "profileDetailSegue", sender: nil)
        
    }
    
}
