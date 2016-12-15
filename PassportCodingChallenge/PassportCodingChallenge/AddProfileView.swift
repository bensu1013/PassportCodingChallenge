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
    
    func dismissAddView()
    func showAlertMessage(alert: UIAlertController)
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
    
    func imageButtonAction() {
        print("get an image ben, do it")
    }
    
    func doneButtonAction() {
        
        if nameField.text != "" && hobbiesField.text != "" && ageField.text != "" {
            
            guard let inputAge = Int(ageField.text!) else { return }
            
            let dict: [String : Any] = ["name" : nameField.text!, "hobbies" : hobbiesField.text!, "age" : inputAge, "gender" : selectedGender.rawValue, "uid" : Int(arc4random())]
            
            let newUser = UserProfile(data: dict)
            
            FirebaseAPI.addProfile(profile: newUser)
            
            clearAllFields()
            
            delegate.dismissAddView()
            
        } else {
            
            
            let alert = UIAlertController(title: "Incomplete", message: "Please fill in all fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            alert.addAction(action)
            delegate.showAlertMessage(alert: alert)
            
        }
        
    }
    
    func clearAllFields() {
        
        nameField.text = ""
        hobbiesField.text = ""
        ageField.text = ""
        
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
        fadeView.backgroundColor = UIColor.orange
        fadeView.alpha = 0.75
        fadeView.isUserInteractionEnabled = false
        
    }
    
    func createNameField() {
        
        self.addSubview(nameField)
        nameField.frame = CGRect(x: self.bounds.width * 0.45, y: self.bounds.height * 0.06, width: self.bounds.width * 0.5, height: self.bounds.height * 0.12)
        nameField.placeholder = "Enter Name"
        nameField.layer.cornerRadius = 5
        nameField.backgroundColor = UIColor.white
        
    }
    
    func createAgeField() {
        
        self.addSubview(ageField)
        ageField.frame = CGRect(x: self.bounds.width * 0.45, y: self.bounds.height * 0.19, width: self.bounds.width * 0.12, height: self.bounds.height * 0.12)
        ageField.placeholder = "Age"
        ageField.layer.cornerRadius = 5
        ageField.backgroundColor = UIColor.white
        
    }
    
    func createGenderField() {
        
        self.addSubview(genderLabel)
        genderLabel.frame = CGRect(x: self.bounds.width * 0.6, y: self.bounds.height * 0.19, width: self.bounds.width * 0.15, height: self.bounds.height * 0.12)
        genderLabel.text = "Gender"
        genderLabel.layer.cornerRadius = 5
        genderLabel.backgroundColor = UIColor.white
        
    }
    
    func createMaleButton() {
        
        self.addSubview(maleButton)
        maleButton.frame = CGRect(x: self.bounds.width * 0.76, y: self.bounds.height * 0.21, width: self.bounds.width * 0.07, height: self.bounds.height * 0.08)
        maleButton.setTitle("M", for: .normal)
        maleButton.backgroundColor = UIColor.cyan
        maleButton.layer.cornerRadius = 5
        maleButton.addTarget(self, action: #selector(maleButtonAction), for: .touchUpInside)
        
    }
    
    func createFemaleButton() {
        
        self.addSubview(femaleButton)
        femaleButton.frame = CGRect(x: self.bounds.width * 0.84, y: self.bounds.height * 0.21, width: self.bounds.width * 0.07, height: self.bounds.height * 0.08)
        femaleButton.setTitle("F", for: .normal)
        femaleButton.backgroundColor = UIColor.cyan
        femaleButton.layer.cornerRadius = 5
        femaleButton.addTarget(self, action: #selector(femaleButtonAction), for: .touchUpInside)
        
    }
    
    func createImageView() {
        
        self.addSubview(imageView)
        imageView.frame = CGRect(x: self.bounds.width * 0.05, y: self.bounds.height * 0.02, width: self.bounds.width * 0.35, height: self.bounds.width * 0.35)
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.backgroundColor = UIColor.gray
        
    }
    
    func createImageButton() {
        
        self.addSubview(imageButton)
        imageButton.frame = CGRect(x: self.bounds.width * 0.05, y: self.bounds.height * 0.02, width: self.bounds.width * 0.35, height: self.bounds.width * 0.35)
        imageButton.layer.cornerRadius = imageButton.bounds.width / 2
        imageButton.addTarget(self, action: #selector(imageButtonAction), for: .touchUpInside)
        
    }
    
    func createHobbiesField() {
        
        self.addSubview(hobbiesField)
        hobbiesField.frame = CGRect(x: self.bounds.width * 0.05, y: self.bounds.height * 0.42, width: self.bounds.width * 0.9, height: self.bounds.height * 0.4)
        hobbiesField.layer.cornerRadius = 6
    }
    
    func createDoneButton() {
        
        self.addSubview(doneButton)
        doneButton.frame = CGRect(x: self.bounds.width * 0.35, y: self.bounds.height * 0.85, width: self.bounds.width * 0.3, height: self.bounds.height * 0.1)
        doneButton.backgroundColor = UIColor.green
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
        
    }
    
}











