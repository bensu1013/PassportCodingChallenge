//
//  FirebaseAPI.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/13/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct FirebaseAPI {
    
    static let ref = FIRDatabase.database().reference()
    
    static func streamList(handler: @escaping ([String : Any]?) -> () ) {
        
        ref.observe(.value, with: { (snapshot) in
            
            if let data = snapshot.value as? [String : Any] {
                
                handler(data)
                
            } else {
                
                handler(nil)
                
            }
            
        })
        
    }
    
    static func addProfile(profile: UserProfile) {
        
        let firebaseData = createFirebaseData(with: profile)
        
        ref.child("\(profile.uid)").setValue(firebaseData)
        
    }
    
    private static func createFirebaseData(with profile: UserProfile) -> [String : Any] {
        
        var returnData: [String : Any] = [:]
        
        returnData["name"] = profile.name
        returnData["age"] = profile.age
        returnData["gender"] = profile.gender.rawValue
        returnData["hobbies"] = profile.hobbies
        
        return returnData
    }
    
    static func removeProfile(id: Int) {
        
        ref.child("\(id)").removeValue()
        
    }
    
}






