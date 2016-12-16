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
    var isAdding = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
        createSortView()
        createAddView()
        createNavBar()
        
        prepareFirebaseObservers()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        FirebaseAPI.readUserList { (data) in
            
            if data != nil {
                
                DataOrganizer.shared.storeProfiles(with: data!)
                
                DispatchQueue.main.async {
                    
                    self.mainTableView.tableView.reloadData()
                    
                }
                
            }
            
        }
    }
    
}

//MARK: - Setup subviews for mainview controller
extension MainViewController {
    
    func createTableView() {
        
        let mainTableViewFrame = CGRect(x: 0, y: self.view.bounds.height * 0.1, width: self.view.bounds.width, height: self.view.bounds.height * 0.9)
        mainTableView = MainTableViewModel(frame: mainTableViewFrame)
        mainTableView.delegate = self
        self.view.addSubview(mainTableView)
        
    }
    
    func createSortView() {
        
        let sortViewFrame = CGRect(x: self.view.bounds.width, y: self.view.bounds.height * 0.1, width: self.view.bounds.width * 0.3, height: self.view.bounds.height * 0.9)
        sortView = SorterView(frame: sortViewFrame)
        sortView.delegate = self
        self.view.addSubview(sortView)
        
    }
    
    func createAddView() {
        
        let addViewFrame = CGRect(x: 0.0, y: self.view.bounds.height * -0.5, width: self.view.bounds.width, height: self.view.bounds.height * 0.5)
        
        addProfileView = AddProfileView(frame: addViewFrame)
        addProfileView.delegate = self
        self.view.addSubview(addProfileView)
        
    }
    
    func createNavBar() {
        
        let navFrame = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height * 0.1)
        navBar = ListNavBar(frame: navFrame)
        navBar.delegate = self
        navBar.backgroundColor = UIColor.cyan
        self.view.addSubview(navBar)
        
    }
    
}

//MARK: - Firebase observer set up
extension MainViewController {
    
    func prepareFirebaseObservers() {
        
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
        
        DispatchQueue.main.async {
            
            self.performSegue(withIdentifier: "profileDetailSegue", sender: nil)

        }
        
    }
    
}

//MARK: - ListNavBarDelegate and methods
extension MainViewController: ListNavBarDelegate {
    
    func addButtonTapped() {
        
        hideSortView()
        
        if isAdding {
            
            hideAddView()
            
        } else {
            
            showAddView()
            
        }
        
        
    }
    
    private func hideAddView() {
        
        isAdding = false
        UIView.animate(withDuration: 0.3, animations: {
            
            let addViewFrame = CGRect(x: 0.0, y: self.view.bounds.height * -0.5, width: self.view.bounds.width, height: self.view.bounds.height * 0.5)
            self.addProfileView.frame = addViewFrame
            
        })
        
    }
    
    private func showAddView() {
        
        isAdding = true
        UIView.animate(withDuration: 0.3, animations: {
            
            let addViewFrame = CGRect(x: 0.0, y: self.view.bounds.height * 0.1, width: self.view.bounds.width, height: self.view.bounds.height * 0.5)
            self.addProfileView.frame = addViewFrame
            
        })
        
    }
    
    func sortButtonTapped() {
        
        hideAddView()
        
        if isSorting {
            
            hideSortView()
            
        } else {
            
            showSortView()
            
        }

    }
    
    private func hideSortView() {
        isSorting = false
        UIView.animate(withDuration: 0.3, animations: {
            
            let sortViewFrame = CGRect(x: self.view.bounds.width, y: self.view.bounds.height * 0.1, width: self.view.bounds.width * 0.3, height: self.view.bounds.height * 0.9)
            self.sortView.frame = sortViewFrame
            
        })
    }
    
    private func showSortView() {
        isSorting = true
        UIView.animate(withDuration: 0.3, animations: {
            
            let sortViewFrame = CGRect(x: self.view.bounds.width * 0.7, y: self.view.bounds.height * 0.1, width: self.view.bounds.width * 0.3, height: self.view.bounds.height * 0.9)
            self.sortView.frame = sortViewFrame
            
        })
    }
}

//MARK: - SorterViewDelegate and methods
extension MainViewController: SorterViewDelegate {
    
    func reloadListView() {
        
        mainTableView.tableView.reloadData()
    
    }
    
}

//MARK: - AddProfileDelegate and methods
extension MainViewController: AddProfileDelegate {
    
    func dismissAddView() {
        
        addButtonTapped()
        
    }
    
    func showAlertMessage(alert: UIAlertController) {
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func showImagePicker(picker: UIImagePickerController) {
        
        present(picker, animated: true, completion: nil)
        
    }
    
    func dismissImagePicker() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
