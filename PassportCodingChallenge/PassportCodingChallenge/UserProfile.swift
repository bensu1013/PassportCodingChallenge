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


struct UserProfile {
    
    var uid: Int = 0
    var gender: Gender = .male
    var name: String = ""
    var age: Int = 0
    var hobbies: String = ""
    
    var image: UIImage?
    var backgroundColor: String?
    
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
            
            if let color = data["color"] as? String {
                
                self.backgroundColor = color
                
            } else {
                
                self.backgroundColor = gender == 0 ? "0x0000FF" : "0x00FF00"
                
            }
                
        }

    }
    
    func getHexString() -> String {
        
        var hexString = "0x000000"
      
        if let color = backgroundColor {
            
            hexString = color
            
        }
        print(hexString)
        return hexString
        
    }
    
}
