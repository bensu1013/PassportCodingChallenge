//
//  UserProfile.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/13/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit

enum Gender: Int {
    
    case male, female
    
}

enum BackgroundColor: Int {
    
    case blue, green, red, white, orange, cyan
    
    func getColor() -> UIColor {
        switch self {
        case .blue:
            return UIColor.blue
        case .green:
            return UIColor.green
        case .red:
            return UIColor.red
        case .white:
            return UIColor.white
        case .orange:
            return UIColor.orange
        case .cyan:
            return UIColor.cyan
        }
    }
}

struct UserProfile {
    
    var uid: Int = 0
    var gender: Gender = .male
    var name: String = ""
    var age: Int = 0
    var hobbies: String = ""
    
    var image: UIImage?
    var userColor: BackgroundColor = .blue
    var backgroundColor: UIColor {
        get {
            return userColor.getColor()
        }
    }
    
    init(data: [String : Any]) {
        
        if let uid = data["uid"] as? Int,
            let gender = data["gender"] as? Int,
            let name = data["name"] as? String,
            let age = data["age"] as? Int,
            let hobbies = data["hobbies"] as? String{
            
            self.uid = uid
            self.gender = gender == 0 ? .male : .female
            self.name = name
            self.age = age
            self.hobbies = hobbies
            
            if let color = data["color"] as? Int {
                
                if let enumColor = BackgroundColor.init(rawValue: color) {
                    
                    self.userColor = enumColor

                }
                
            } else {
                
                self.userColor = gender == 0 ? .blue : .green
                
            }
                
        }

    }
    
}
