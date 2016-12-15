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
    var navBar: ListNavBar!
    var sortView: SorterView!
    var addProfileView: AddProfileView!
    
    var isSorting = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNavBar()
        createTableView()
        createSortView()
    
        prepareFirebaseObservers()
        
    }

    
    
}

//MARK: - Setup subviews for mainview controller
extension MainViewController {
    
    func createNavBar() {
        
        let navFrame = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height * 0.1)
        navBar = ListNavBar(frame: navFrame)
        navBar.delegate = self
        navBar.backgroundColor = UIColor.cyan
        self.view.addSubview(navBar)
        
    }
    
    func createTableView() {
        
        let mainTableViewFrame = CGRect(x: 0, y: self.view.bounds.height * 0.1, width: self.view.bounds.width, height: self.view.bounds.height * 0.9)
        mainTableView = MainTableViewModel(frame: mainTableViewFrame)
        mainTableView.delegate = self
        self.view.addSubview(mainTableView)
        
    }
    
    func createSortView() {
        
        let sortViewFrame = CGRect(x: self.view.bounds.width, y: self.view.bounds.height * 0.1, width: self.view.bounds.width * 0.3, height: self.view.bounds.height * 0.9)
        sortView = SorterView(frame: sortViewFrame)
        self.view.addSubview(sortView)
        
    }
    
    
    
}

//MARK: - Firebase observer set up
extension MainViewController {
    
    func prepareFirebaseObservers() {
        
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

//MARK: - MainTableViewDelegate and methods
extension MainViewController: MainTableViewDelegate {
    
    func segueAction() {
        
        performSegue(withIdentifier: "profileDetailSegue", sender: nil)
        
    }
    
}

//MARK: - ListNavBarDelegate and methods
extension MainViewController: ListNavBarDelegate {
    
    func addButtonTapped() {
        print("ADDDDDd")
    }
    
    func sortButtonTapped() {
        
        if isSorting {
            
            isSorting = false
            UIView.animate(withDuration: 0.3, animations: {
                
                let sortViewFrame = CGRect(x: self.view.bounds.width, y: self.view.bounds.height * 0.1, width: self.view.bounds.width * 0.3, height: self.view.bounds.height * 0.9)
                self.sortView.frame = sortViewFrame
                
            })
            
        } else {
            
            isSorting = true
            UIView.animate(withDuration: 0.3, animations: {
                
                let sortViewFrame = CGRect(x: self.view.bounds.width * 0.7, y: self.view.bounds.height * 0.1, width: self.view.bounds.width * 0.3, height: self.view.bounds.height * 0.9)
                self.sortView.frame = sortViewFrame
                
            })
        }

    }
    
}
