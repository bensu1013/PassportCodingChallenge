//
//  FirebaseAPI.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/13/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseStorage

struct FirebaseAPI {
    
    fileprivate static let ref = FIRDatabase.database().reference()
    fileprivate static let storageRef = FIRStorage.storage().reference(forURL: "gs://passportcodingchallenge.appspot.com")
    //Read profile list from firebase when app loads
    static func readUserList(handler: @escaping ([String : Any]?) -> () ) {
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let data = snapshot.value as? [String : Any] {
                
                handler(data)
                
            } else {
                
                handler(nil)
                
            }
            
        })
        
    }
    
    //Observe for added objects through out apps life time
    static func observeAddedProfiles(handler: @escaping ([String : Any]) -> () ) {
        
        ref.observe(.childAdded, with: { (snapshot) in
            
            if let data = snapshot.value as? [String : Any] {
                
                handler(data)
                
            }
            
        })
        
    }
    
    //Observe for removed objects through out the apps life time
    static func observeRemovedProfiles(handler: @escaping ([String : Any]) -> () ) {
        
        ref.observe(.childRemoved, with: { (snapshot) in
            
            if let data = snapshot.value as? [String : Any] {
                
                handler(data)
                
            }
            
        })
        
    }
    
    static func observeChangedProfiles(handler: @escaping ([String : Any]) -> () ) {
        
        ref.observe(.childChanged, with: { (snapshot) in
            
            if let data = snapshot.value as? [String : Any] {
                
                handler(data)
                
            }
            
        })
        
    }
    
    static func updateProfile(with id: Int, color: Int, hobbies: String?) {
        
        ref.child("\(id)").child("color").setValue(color)
        
        if let hobbies = hobbies {
            
            ref.child("\(id)").child("hobbies").setValue(hobbies)
            
        }
        
        
    }
    
    //Write to firebase a new user profile
    static func addProfile(profile: UserProfile) {
        
        let firebaseData = createFirebaseData(with: profile)
        
        ref.child("\(profile.uid)").setValue(firebaseData)
        
    }
    
    //Wraps userprofile in to dictionary to send to firebase
    private static func createFirebaseData(with profile: UserProfile) -> [String : Any] {
        
        var returnData: [String : Any] = [:]
        
        returnData["uid"] = profile.uid
        returnData["name"] = profile.name
        returnData["age"] = profile.age
        returnData["gender"] = profile.gender.rawValue
        returnData["hobbies"] = profile.hobbies
        returnData["color"] = profile.userColor.rawValue
        
        return returnData
    }
    
    //Remove profile from firebase with ID in argument
    static func removeProfile(id: Int) {
        
        ref.child("\(id)").removeValue()
        
    }
    
}

//Firebase Storage methods
extension FirebaseAPI {
    
    static func storeImage(with uid: Int, imageData: Data) {
        
        let userRef = storageRef.child("images/\(uid).jpeg")
        
        let uploadTask = userRef.put(imageData, metadata: nil)
        
    }
    
    static func readImage(with uid: Int, handler: @escaping (UIImage?) -> () ) {
        
        let userRef = storageRef.child("images/\(uid).jpeg")
        
        userRef.data(withMaxSize: 1 * 1024 * 1024) { (data, error) in
            
            if error != nil {
    
                handler(nil)
                
            } else {
                
                if let data = data {
                    print("got some data")
                    let image = UIImage(data: data)

                    handler(image)
                    
                }
                
            }
            
        }
        
    }
    
    static func deleteImage(with uid: Int) {
        
        let deleteRef = storageRef.child("image/\(uid).jpeg")
        
        deleteRef.delete { (error) in
            
        }
        
    }
    
    
    
}



