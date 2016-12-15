//
//  DetailView.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/14/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit

class DetailView: UIView {
    
    let user = DataOrganizer.shared.peekDetailProfile
    
    var profileImage = UIImageView()
    var uidLabel = UILabel()
    var nameLabel = UILabel()
    var genderLabel = UILabel()
    var ageLabel = UILabel()
    var hobbiesText = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DetailView {
    
    func setupSubviews() {
        
        createPofileImage()
        createUIDLabel()
        createNameLabel()
        createGenderLabel()
        createAgeLabel()
        createHobbiesText()
        
    }
    
    func createPofileImage() {
        
        self.addSubview(profileImage)
        profileImage.frame = CGRect(x: self.bounds.width * 0.05 , y: self.bounds.width * 0.05, width: self.bounds.width * 0.4, height: self.bounds.width * 0.4)
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2
        profileImage.backgroundColor = UIColor.gray
        
    }
    
    func createUIDLabel() {
        
        self.addSubview(uidLabel)
        uidLabel.frame = CGRect(x: self.bounds.width * 0.55, y: self.bounds.height * 0.1, width: self.bounds.width * 0.4, height: self.bounds.height * 0.04)
        uidLabel.text = "ID: \(user.uid)"
        
    }
    
    func createNameLabel() {
        
        self.addSubview(nameLabel)
        nameLabel.frame = CGRect(x: self.bounds.width * 0.55, y: self.bounds.height * 0.15, width: self.bounds.width * 0.4, height: self.bounds.height * 0.04)
        nameLabel.text = "Name: \(user.name)"
        
    }
    
    func createGenderLabel() {
        
        self.addSubview(genderLabel)
        genderLabel.frame = CGRect(x: self.bounds.width * 0.55, y: self.bounds.height * 0.2, width: self.bounds.width * 0.225, height: self.bounds.height * 0.04)
        genderLabel.text = "Gender: \((user.gender == .male ? "M" : "F"))"
        
    }
    
    func createAgeLabel() {
        
        self.addSubview(ageLabel)
        ageLabel.frame = CGRect(x: self.bounds.width * 0.775, y: self.bounds.height * 0.2, width: self.bounds.width * 0.225, height: self.bounds.height * 0.04)
        ageLabel.text = "Age: \(user.age)"
        
    }
    
    func createHobbiesText() {
        
        self.addSubview(hobbiesText)
        hobbiesText.frame = CGRect(x: self.bounds.width * 0.1, y: self.bounds.height * 0.4, width: self.bounds.width * 0.8, height: self.bounds.height * 0.5)
        hobbiesText.text = " ~ Hobbies ~ \n\(user.hobbies)"
        hobbiesText.textAlignment = .center
        hobbiesText.font = Constants.detailViewFont
        
    }
    
}





