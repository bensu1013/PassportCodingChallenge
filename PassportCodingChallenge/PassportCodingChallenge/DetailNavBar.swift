//
//  NavigationBar.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/14/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit

protocol DetailNavBarDelegate {
    
    func backButtonTapped()
    func updateButtonTapped()
    func removeButtonTapped()
    
}

class DetailNavBar: UIView {
    
    var delegate: DetailNavBarDelegate!
    
    //Subviews for detailView
    var backButton = UIButton()
    var removeButton = UIButton()
    var updateButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func backButtonAction() {
        
        delegate.backButtonTapped()
        
    }
    
    func updateButtonAction() {
        
        delegate.updateButtonTapped()
        
    }
    func removeButtonAction() {

        delegate.removeButtonTapped()
        
    }
    
}

//MARK: - Setup subviews for detail navigation bar
extension DetailNavBar {
    
    func setupSubviews() {
        
        createBackButton()
        createUpdateButton()
        createRemoveButton()
        
    }
    
    func createBackButton() {
        
        self.addSubview(backButton)
        backButton.frame = CGRect(x: self.frame.width * 0.05, y: self.frame.height * 0.4, width: self.frame.height * 0.5, height: self.frame.height * 0.5)
        backButton.setTitle("⬅", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
    }
    func createUpdateButton() {
        
        self.addSubview(updateButton)
        updateButton.frame = CGRect(x: self.frame.width * 0.9, y: self.frame.height * 0.4, width: self.frame.height * 0.5, height: self.frame.height * 0.5)
        updateButton.setTitle("📝", for: .normal)
        updateButton.addTarget(self, action: #selector(updateButtonAction), for: .touchUpInside)
        
    }
    func createRemoveButton() {
        
        self.addSubview(removeButton)
        removeButton.frame = CGRect(x: self.frame.width * 0.8, y: self.frame.height * 0.4, width: self.frame.height * 0.5, height: self.frame.height * 0.5)
        removeButton.setTitle("🚫", for: .normal)
        removeButton.addTarget(self, action: #selector(removeButtonAction), for: .touchUpInside)
        
    }
    

    
    
}
