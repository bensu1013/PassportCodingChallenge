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
    var updateView: UpdateView!
    var navBar: DetailNavBar!
    
    var isUpdating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let detailViewFrame = CGRect(x: 0.0, y: self.view.bounds.height * 0.1, width: self.view.bounds.width, height: self.view.bounds.height * 0.9)
        detailView = DetailView(frame: detailViewFrame)
        self.view.addSubview(detailView)
    
        let updateViewFrame = CGRect(x: 0.0, y: self.view.bounds.height * -0.5, width: self.view.bounds.width, height: self.view.bounds.height * 0.5)
        updateView = UpdateView(frame: updateViewFrame)
        updateView.delegate = self
        updateView.isHidden = true
        self.view.addSubview(updateView)
        
        let navFrame = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height * 0.1)
        navBar = DetailNavBar(frame: navFrame)
        navBar.delegate = self
        navBar.backgroundColor = UIColor.cyan
        self.view.addSubview(navBar)
    }



}

extension DetailViewController: UpdateViewDelegate {
    
    
    
}

extension DetailViewController: DetailNavBarDelegate {
    
    func backButtonTapped() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func updateButtonTapped() {
        
        if isUpdating {
            
            hideUpdateView()
            
        } else {
            
            showUpdateView()
            
        }
        
    }
    
    private func hideUpdateView() {
        
        isUpdating = false
        updateView.isHidden = true
        UIView.animate(withDuration: 0.3, animations: {
            
            let updateViewFrame = CGRect(x: 0.0, y: self.view.bounds.height * -0.5, width: self.view.bounds.width, height: self.view.bounds.height * 0.5)
            self.updateView.frame = updateViewFrame
            
        })
        
    }
    
    private func showUpdateView() {
        
        isUpdating = true
        updateView.isHidden = false
        UIView.animate(withDuration: 0.3, animations: {
            
            let updateViewFrame = CGRect(x: 0.0, y: self.view.bounds.height * 0.1, width: self.view.bounds.width, height: self.view.bounds.height * 0.5)
            self.updateView.frame = updateViewFrame
            
        })
        
    }
    func removeButtonTapped() {
        
        FirebaseAPI.removeProfile(id: detailView.user.uid)
        
        dismiss(animated: true, completion: nil)
        
    }
    
}











