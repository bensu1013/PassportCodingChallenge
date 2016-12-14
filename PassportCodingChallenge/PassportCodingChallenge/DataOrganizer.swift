//
//  DataOrganizer.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/13/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation

class DataOrganizer {
    
    private init() {}
    
    fileprivate var profiles: [UserProfile] = []
    fileprivate var sortedProfiles: [UserProfile] = []
    
    static var shared = DataOrganizer()
    var isSorted = false
    
    func peekProfiles() -> [UserProfile] {
        
        return isSorted ? sortedProfiles : profiles
        
    }
    
    func storeProfiles(with data: [String : Any]) {
        
        profiles.removeAll()
        
        for (k , v) in data {
            print(k)
            if let id = Int(k),
                let user = v as? [String : Any] {
                
                let profile = UserProfile(id: id, data: user)
                print("pre sort")
                binarySort(by: profile)
                print("post sort")
            }
            
            
        }
        
    }
    
    
}

//MARK: - Sorting methods
extension DataOrganizer {
    
    func binarySort(by profile: UserProfile) {
        
        if profiles.isEmpty {
            
            profiles.append(profile)
            
        } else {
            
            var max = profiles.count - 1
            var mid = max / 2
            var min = 0
            
            //finish polishing logic for binary search
            while max != min {
                
                if profile.uid > profiles[mid].uid {
                    
                    min = mid + 1
                    mid = ((max - min) / 2 ) + min
                    
                } else {
                    
                    max = mid + 1
                    mid = ((max - min) / 2 ) + min
                    
                }
                print("\(max) : \(mid) : \(min)")
            }
            
            profiles.insert(profile, at: mid)
            
        }
        
    }
    
    func sort(by gender: Gender) {
        
        sortedProfiles.removeAll()
        
        for profile in profiles {
            
            if profile.gender == gender {
                
                sortedProfiles.append(profile)
                
            }
            
        }
        
    }
    
    
    
    
    
    
}







