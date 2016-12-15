//
//  AddProfileView.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/15/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit

protocol AddProfileDelegate {
    
}

class AddProfileView: UIView {
    
    var delegate: AddProfileDelegate!
    
    var nameField = UITextField()
    var ageField = UITextField()
    var genderLabel = UILabel()
    var maleButton = UIButton()
    var femaleButton = UIButton()
    var imageView = UIImageView()
    var imageButton = UIButton()
    var hobbiesField = UITextView()
    var doneButton = UIButton()
    
    var selectedGender: Gender = .male
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}

//MARK: - Setup subviews for add profile
extension AddProfileView {
    
    func setupSubviews() {
        
        createNameField()
        createAgeField()
        createGenderField()
        createMaleButton()
        createFemaleButton()
        createImageView()
        createImageButton()
        createHobbiesField()
        createDoneButton()
        
    }
    
    func createNameField() {
        
        self.addSubview(nameField)
        nameField.frame = CGRect()
        
    }
    
    func createAgeField() {
        
        self.addSubview(ageField)
        ageField.frame = CGRect()
        
    }
    
    func createGenderField() {
        
        self.addSubview(genderLabel)
        genderLabel.frame = CGRect()
        
    }
    
    func createMaleButton() {
        
        self.addSubview(maleButton)
        maleButton.frame = CGRect()
        
    }
    
    func createFemaleButton() {
        
        self.addSubview(femaleButton)
        femaleButton.frame = CGRect()
        
    }
    
    func createImageView() {
        
        self.addSubview(imageView)
        imageView.frame = CGRect(x: self.bounds.width * 0.05, y: self.bounds.width * 0.05, width: self.bounds.width * 0.35, height: self.bounds.width * 0.35)
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        
    }
    
    func createImageButton() {
        
        self.addSubview(imageButton)
        imageButton.frame = CGRect(x: self.bounds.width * 0.05, y: self.bounds.width * 0.05, width: self.bounds.width * 0.35, height: self.bounds.width * 0.35)
        imageButton.layer.cornerRadius = imageButton.bounds.width / 2
        
    }
    
    func createHobbiesField() {
        
        self.addSubview(hobbiesField)
        hobbiesField.frame = CGRect()
    }
    
    func createDoneButton() {
        
        self.addSubview(doneButton)
        
        
        
    }
    
}











