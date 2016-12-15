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
    
    var fadeView = UIView()
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
    
    func maleButtonAction() {
        selectedGender = .male
    }
    func femaleButtonAction() {
        selectedGender = .female
    }
    
}

//MARK: - Setup subviews for add profile
extension AddProfileView {
    
    func setupSubviews() {
        
        createFadeView()
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
    
    func createFadeView() {
        
        self.addSubview(fadeView)
        fadeView.frame = self.bounds
        fadeView.backgroundColor = UIColor.gray
        fadeView.alpha = 0.5
        fadeView.isUserInteractionEnabled = false
    }
    
    func createNameField() {
        
        self.addSubview(nameField)
        nameField.frame = CGRect(x: self.bounds.width * 0.45, y: self.bounds.height * 0.02, width: self.bounds.width * 0.5, height: self.bounds.height * 0.12)
        nameField.placeholder = "Enter Name"
    }
    
    func createAgeField() {
        
        self.addSubview(ageField)
        ageField.frame = CGRect(x: self.bounds.width * 0.45, y: self.bounds.height * 0.15, width: self.bounds.width * 0.12, height: self.bounds.height * 0.12)
        ageField.placeholder = "Age"
    }
    
    func createGenderField() {
        
        self.addSubview(genderLabel)
        genderLabel.frame = CGRect(x: self.bounds.width * 0.6, y: self.bounds.height * 0.15, width: self.bounds.width * 0.15, height: self.bounds.height * 0.12)
        genderLabel.text = "Gender"
        
    }
    
    func createMaleButton() {
        
        self.addSubview(maleButton)
        maleButton.frame = CGRect(x: self.bounds.width * 0.76, y: self.bounds.height * 0.15, width: self.bounds.width * 0.7, height: self.bounds.height * 0.12)
        maleButton.setTitle("M", for: .normal)
        
    }
    
    func createFemaleButton() {
        
        self.addSubview(femaleButton)
        femaleButton.frame = CGRect(x: self.bounds.width * 0.84, y: self.bounds.height * 0.15, width: self.bounds.width * 0.7, height: self.bounds.height * 0.12)
        femaleButton.setTitle("F", for: .normal)
        
    }
    
    func createImageView() {
        
        self.addSubview(imageView)
        imageView.frame = CGRect(x: self.bounds.width * 0.05, y: self.bounds.height * 0.02, width: self.bounds.width * 0.35, height: self.bounds.width * 0.35)
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        
    }
    
    func createImageButton() {
        
        self.addSubview(imageButton)
        imageButton.frame = CGRect(x: self.bounds.width * 0.05, y: self.bounds.height * 0.02, width: self.bounds.width * 0.35, height: self.bounds.width * 0.35)
        imageButton.layer.cornerRadius = imageButton.bounds.width / 2
        
    }
    
    func createHobbiesField() {
        
        self.addSubview(hobbiesField)
        hobbiesField.frame = CGRect(x: self.bounds.width * 0.05, y: self.bounds.height * 0.42, width: self.bounds.width * 0.9, height: self.bounds.height * 0.4)
    }
    
    func createDoneButton() {
        
        self.addSubview(doneButton)
        
        
        
    }
    
}











