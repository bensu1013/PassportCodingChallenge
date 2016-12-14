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
    var backgroundColor: UIColor?
    
    init(id: Int, data: [String : Any]) {
        
        self.uid = id
        
        if let gender = data["gender"] as? Int,
            let name = data["name"] as? String,
            let age = data["age"] as? Int,
            let hobbies = data["hobbies"] as? String {
            
            self.gender = gender == 0 ? .male : .female
            self.backgroundColor = gender == 0 ? UIColor.blue : UIColor.green
            self.name = name
            self.age = age
            self.hobbies = hobbies
                
        }

    }
    
}
