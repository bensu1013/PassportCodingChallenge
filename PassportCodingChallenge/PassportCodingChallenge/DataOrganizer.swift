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
    
    //Called when app opens, pulls all existing profiles
    func storeProfiles(with data: [String : Any]) {

        profiles.removeAll()
        
        for (k , v) in data {
            print(k)
            if let user = v as? [String : Any] {
                
                let profile = UserProfile(data: user)
 
                binarySort(by: profile)

            }
            
            
        }
        
    }
    
    //Method used to add profile to local data
    func addProfile(with data: [String : Any]) {
        
        let profile = UserProfile(data: data)
        
        binarySort(by: profile)
        
    }
    
    //Method used to remove a profile from array containing the same uid
    func removeProfile(with data: [String : Any]) {
        
        if let uid = data["uid"] as? Int {
            
            let index = binarySearch(by: uid)
        
            profiles.remove(at: index)
            
        }
        
    }
    
}

//MARK: - Sorting methods
extension DataOrganizer {
    
    //Binary search for a specific uid and returns index of element
    fileprivate func binarySearch(by uid: Int) -> Int {
        
        var max = profiles.count - 1
        var mid = max / 2
        var min = 0
        
        while max > min {
            
            if uid > profiles[mid].uid {
                
                min = mid + 1
                mid = (max + min ) / 2
                
            } else if uid < profiles[mid].uid {
                
                
                max = mid - 1
                mid = (max + min) / 2
                
                
            } else {
                
                break
                
            }
    
        }
        
        return mid
        
    }
    
    //Method using binary search logic to insert new elements in to the array of profiles
    fileprivate func binarySort(by profile: UserProfile) {
        
        if profiles.isEmpty {
            
            profiles.append(profile)
            
        } else if profiles.count == 1 {
        
            if profile.uid > profiles[0].uid {
                
                profiles.append(profile)
                
            } else {
                
                profiles.insert(profile, at: 0)
                
            }
            
        } else {
            
            var max = profiles.count - 1
            var mid = max / 2
            var min = 0
            
            while max >= min {
                
                if profile.uid > profiles[mid].uid {
                    
                    if mid >= profiles.count - 1 {
                        
                        profiles.append(profile)
                        break
                        
                    } else if (min == mid) && (mid == max) {
                        
                        profiles.insert(profile, at: mid + 1)
                        break
                        
                    } else {
                        
                        min = mid + 1
                        mid = (max + min ) / 2
                        
                    }
                    
                } else {
                    
                    if mid <= 0 {
                        
                        profiles.insert(profile, at: 0)
                        break
                        
                    } else if (min == mid) && (mid == max) {
                        
                        profiles.insert(profile, at: mid)
                        break
                        
                    } else {
                        
                        max = mid - 1
                        mid = (max + min) / 2
                        
                    }
                    
                }
                
            }
            
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







