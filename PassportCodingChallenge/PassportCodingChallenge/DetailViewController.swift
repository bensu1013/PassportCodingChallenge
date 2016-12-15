//
//  DetailViewController.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/14/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var detailView: DetailView!
    var navBar: DetailNavBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let detailViewFrame = CGRect(x: 0.0, y: self.view.bounds.height * 0.1, width: self.view.bounds.width, height: self.view.bounds.height * 0.9)
        detailView = DetailView(frame: detailViewFrame)
        self.view.addSubview(detailView)
    
        
        let navFrame = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height * 0.1)
        navBar = DetailNavBar(frame: navFrame)
        navBar.delegate = self
        navBar.backgroundColor = UIColor.cyan
        self.view.addSubview(navBar)
    }



}


extension DetailViewController: DetailNavBarDelegate {
    
    func backButtonTapped() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func updateButtonTapped() {
        
        
        
    }
    
    func removeButtonTapped() {
        
        FirebaseAPI.removeProfile(id: detailView.user.uid)
        
        dismiss(animated: true, completion: nil)
        
    }
    
}











