//
//  DataOrganizer.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/13/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation

//TODO: - change isFiltered to be a enum / case for more flexibility in code

class DataOrganizer {
    
    private init() {}
    
    fileprivate var profiles: [UserProfile] = []
    fileprivate var sortedProfiles: [UserProfile] = []
    fileprivate var isFiltered = false
    static var shared = DataOrganizer()
    
    
    var peekProfiles: [UserProfile] { get { return isFiltered ? sortedProfiles : profiles } }
    
    
    
    //Called when app opens, pulls all existing profiles
    func storeProfiles(with data: [String : Any]) {

        profiles.removeAll()
        
        for (_, v) in data {
          
            if let user = v as? [String : Any] {
                
                let profile = UserProfile(data: user)
                binarySort(byUID: profile)

            }
            
        }
        
    }
    
    //Method used to add profile to local data
    func addProfile(with data: [String : Any]) {
        
        let profile = UserProfile(data: data)
        
        binarySort(byUID: profile)
        
    }
    
    //Method used to remove a profile from array containing the same uid
    func removeProfile(with data: [String : Any]) {
        
        if let uid = data["uid"] as? Int {
            
            let index = binarySearch(by: uid)
        
            profiles.remove(at: index)
            
        }
        
    }
    
    func editProfile(with data: [String : Any]) {
        
        let profile = UserProfile(data: data)
        
        let index = binarySearch(by: profile.uid)
        
        profiles.remove(at: index)
        profiles.insert(profile, at: index)
        
    }
    
}

//MARK: - Filter methods
extension DataOrganizer {
    
    func clearFilters() {
        
        isFiltered = false
        
    }
    
    //Filters profiles by gender
    func filter(by gender: Gender) {
        
        isFiltered = true
        sortedProfiles.removeAll()
        
        for profile in profiles {
            
            if profile.gender == gender {
                
                sortedProfiles.append(profile)
                
            }
            
        }
        
    }
    
    //Sort profiles by age in ascending or descending order
    func filter(ageBy ascending: Bool) {
        
        isFiltered = true
        sortedProfiles.removeAll()
        
        for profile in profiles {
            
            binarySort(byAge: profile)
            
        }
        
        if !ascending {
            
            sortedProfiles.reverse()
            
        }
        
    }
    
    func filter(nameBy ascending: Bool) {
        
        isFiltered = true
        sortedProfiles.removeAll()
        
        for profile in profiles {
            
            binarySort(byName: profile)
            
        }
        
        if !ascending {
            
            sortedProfiles.reverse()
            
        }
        
    }
    
}

//MARK: - Private binary search and sort methods
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
    
    //Method using binary search logic to insert new elements in to the array of profiles by their unique id
    fileprivate func binarySort(byUID profile: UserProfile) {
        
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
    
    //Method using binary search logic to insert new elements in to the array of profiles by their age
    fileprivate func binarySort(byAge profile: UserProfile) {
        
        if sortedProfiles.isEmpty {
            
            sortedProfiles.append(profile)
            
        } else if profiles.count == 1 {
            
            if profile.age > sortedProfiles[0].age {
                
                sortedProfiles.append(profile)
                
            } else {
                
                sortedProfiles.insert(profile, at: 0)
                
            }
            
        } else {
            
            var max = sortedProfiles.count - 1
            var mid = max / 2
            var min = 0
            
            while max >= min {
                
                if profile.age > sortedProfiles[mid].age {
                    
                    if mid >= sortedProfiles.count - 1 {
                        
                        sortedProfiles.append(profile)
                        break
                        
                    } else if (min == mid) && (mid == max) {
                        
                        sortedProfiles.insert(profile, at: mid + 1)
                        break
                        
                    } else {
                        
                        min = mid + 1
                        mid = (max + min ) / 2
                        
                    }
                    
                } else {
                    
                    if mid <= 0 {
                        
                        sortedProfiles.insert(profile, at: 0)
                        break
                        
                    } else if (min == mid) && (mid == max) {
                        
                        sortedProfiles.insert(profile, at: mid)
                        break
                        
                    } else {
                        
                        max = mid - 1
                        mid = (max + min) / 2
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    //Method using binary search logic to insert new elements in to the array of profiles by their age
    fileprivate func binarySort(byName profile: UserProfile) {
        
        if sortedProfiles.isEmpty {
            
            sortedProfiles.append(profile)
            
        } else if sortedProfiles.count == 1 {
            
            if profile.name > sortedProfiles[0].name {
                
                sortedProfiles.append(profile)
                
            } else {
                
                sortedProfiles.insert(profile, at: 0)
                
            }
            
        } else {
            
            var max = sortedProfiles.count - 1
            var mid = max / 2
            var min = 0
            
            while max >= min {
                
                if profile.name > sortedProfiles[mid].name {
                    
                    if mid >= sortedProfiles.count - 1 {
                        
                        sortedProfiles.append(profile)
                        break
                        
                    } else if (min == mid) && (mid == max) {
                        
                        sortedProfiles.insert(profile, at: mid + 1)
                        break
                        
                    } else {
                        
                        min = mid + 1
                        mid = (max + min ) / 2
                        
                    }
                    
                } else {
                    
                    if mid <= 0 {
                        
                        sortedProfiles.insert(profile, at: 0)
                        break
                        
                    } else if (min == mid) && (mid == max) {
                        
                        sortedProfiles.insert(profile, at: mid)
                        break
                        
                    } else {
                        
                        max = mid - 1
                        mid = (max + min) / 2
                        
                    }
                    
                }
                
            }
            
        }
        
    }
}
