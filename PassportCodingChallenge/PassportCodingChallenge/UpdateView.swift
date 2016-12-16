//
//  UpdateView.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/15/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit

//blue, green, red, orange, cyan

protocol UpdateViewDelegate: class {
    
    func sendUpdateInfo(color: BackgroundColor, hobbies: String?)
    func dismissUpdateView()
    func showAlertMessage(alert: UIAlertController)
    
}

class UpdateView: UIView {
    
    weak var delegate: UpdateViewDelegate!
    
    var fadeView = UIView()
    var hobbiesField = UITextView()
    var selectedColor: BackgroundColor = .blue
    var colorLabel = UILabel()
    var blueButton = UIButton()
    var greenButton = UIButton()
    var redButton = UIButton()
    var orangeButton = UIButton()
    var cyanButton = UIButton()
    
    var doneButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func colorButtonSelection(sender: UIButton!) {
        
        switch sender.backgroundColor! {
        case UIColor.blue:
            selectedColor = .blue
            doneButton.backgroundColor = UIColor.blue
        case UIColor.green:
            selectedColor = .green
            doneButton.backgroundColor = UIColor.green
        case UIColor.red:
            selectedColor = .red
            doneButton.backgroundColor = UIColor.red
        case UIColor.orange:
            selectedColor = .orange
            doneButton.backgroundColor = UIColor.orange
        case UIColor.cyan:
            selectedColor = .cyan
            doneButton.backgroundColor = UIColor.cyan
        default:
            selectedColor = .blue
            doneButton.backgroundColor = UIColor.blue
        }
        
    }
    
    func doneButtonAction() {
        
        if hobbiesField.text != "" {
            
            self.delegate.sendUpdateInfo(color: self.selectedColor, hobbies: hobbiesField.text!)
            self.delegate.dismissUpdateView()
            
        } else {
            
            let alert = UIAlertController(title: "Hobbies", message: "There is no changes, is that correct?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Wait", style: .cancel, handler: nil)
            let agreeAction = UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                
                self.delegate.sendUpdateInfo(color: self.selectedColor, hobbies: nil)
                self.delegate.dismissUpdateView()
                
            })
            
            alert.addAction(cancelAction)
            alert.addAction(agreeAction)
            delegate.showAlertMessage(alert: alert)
            
        }
        
    }
    
}


extension UpdateView {
    
    func setupSubviews() {
        
        createFadeView()
        createHobbiesField()
        createColorLabel()
        createBlueButton()
        createGreenButton()
        createRedButton()
        createOrangeButton()
        createCyanButton()
        createDoneButton()
        
    }
    
    func createFadeView() {
        
        self.addSubview(fadeView)
        fadeView.frame = self.bounds
        fadeView.backgroundColor = UIColor.lightGray
        fadeView.alpha = 0.6
        
    }
    
    func createHobbiesField() {
        
        self.addSubview(hobbiesField)
        hobbiesField.frame = CGRect(x: self.bounds.width * 0.1, y: self.bounds.height * 0.1, width: self.bounds.width * 0.8, height: self.bounds.height * 0.4)
        hobbiesField.layer.cornerRadius = 6
        
    }
    
    func createColorLabel() {
        
        self.addSubview(colorLabel)
        colorLabel.frame = CGRect(x: self.bounds.width * 0.35, y: self.bounds.height * 0.5, width: self.bounds.width * 0.3, height: self.bounds.height * 0.12)
        colorLabel.text = "Pick A Color"
        colorLabel.layer.cornerRadius = 7
        colorLabel.backgroundColor = UIColor.yellow
        
    }
    
    func createBlueButton() {
        
        self.addSubview(blueButton)
        blueButton.frame = CGRect(x: self.bounds.width * 0.15, y: self.bounds.height * 0.7, width: self.bounds.width * 0.14, height: self.bounds.height * 0.12)
        blueButton.backgroundColor = UIColor.blue
        blueButton.addTarget(self, action: #selector(colorButtonSelection), for: .touchUpInside)
        
    }
    
    func createGreenButton() {
        
        self.addSubview(greenButton)
        greenButton.frame = CGRect(x: self.bounds.width * 0.29, y: self.bounds.height * 0.7, width: self.bounds.width * 0.14, height: self.bounds.height * 0.12)
        greenButton.backgroundColor = UIColor.green
        greenButton.addTarget(self, action: #selector(colorButtonSelection), for: .touchUpInside)
    }
    
    func createRedButton() {
        
        self.addSubview(redButton)
        redButton.frame = CGRect(x: self.bounds.width * 0.43, y: self.bounds.height * 0.7, width: self.bounds.width * 0.14, height: self.bounds.height * 0.12)
        redButton.backgroundColor = UIColor.red
        redButton.addTarget(self, action: #selector(colorButtonSelection), for: .touchUpInside)
    }
    
    func createOrangeButton() {
        
        self.addSubview(orangeButton)
        orangeButton.frame = CGRect(x: self.bounds.width * 0.57, y: self.bounds.height * 0.7, width: self.bounds.width * 0.14, height: self.bounds.height * 0.12)
        orangeButton.backgroundColor = UIColor.orange
        orangeButton.addTarget(self, action: #selector(colorButtonSelection), for: .touchUpInside)
    }
    
    func createCyanButton() {
        
        self.addSubview(cyanButton)
        cyanButton.frame = CGRect(x: self.bounds.width * 0.71, y: self.bounds.height * 0.7, width: self.bounds.width * 0.14, height: self.bounds.height * 0.12)
        cyanButton.backgroundColor = UIColor.cyan
        cyanButton.addTarget(self, action: #selector(colorButtonSelection), for: .touchUpInside)
    }
    
    func createDoneButton() {
        
        self.addSubview(doneButton)
        doneButton.frame = CGRect(x: self.bounds.width * 0.35, y: self.bounds.height * 0.86, width: self.bounds.width * 0.3, height: self.bounds.height * 0.12)
        doneButton.backgroundColor = UIColor.blue
        doneButton.layer.cornerRadius = 7
        doneButton.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
        
    }
    
}

