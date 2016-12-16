//
//  SorterView.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/15/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit

protocol SorterViewDelegate: class {
    
    func reloadListView()
    
}

class SorterView: UIView {
    
    let store = DataOrganizer.shared
    var delegate: SorterViewDelegate!
    
    var fadeView = UIView()
    var clearButton = UIButton()
    var sortFemaleButton = UIButton()
    var sortMaleButton = UIButton()
    var ageButton = UIButton()
    var nameButton = UIButton()
    
    var isAgeSort: SortDirection?
    var isNameSort: SortDirection?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createFadeView()
        createClearButton()
        createSortFemaleButton()
        createSortMaleButton()
        createAgeButton()
        createNameButton()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func clearButtonAction() {
        
        store.clearFilters()
        isAgeSort = nil
        isNameSort = nil
        delegate.reloadListView()
        
    }
    
    func sortFemaleButtonAction() {
        
        store.filter(by: .female)
        delegate.reloadListView()
        
    }
    
    func sortMaleButtonAction() {
        
        store.filter(by: .male)
        delegate.reloadListView()
        
    }
    
    func ageButtonAction() {
        
        isNameSort = nil
        if isAgeSort == nil || isAgeSort == .descend {
            
            isAgeSort = .ascend
            store.filter(ageBy: .ascend)
            delegate.reloadListView()
            
        } else {
            
            isAgeSort = .descend
            store.filter(ageBy: .descend)
            delegate.reloadListView()
            
        }
       
        
    }
    
    func nameButtonAction() {
        
        isAgeSort = nil
        if isNameSort == nil || isNameSort == .descend {
            
            isNameSort = .ascend
            store.filter(nameBy: .ascend)
            delegate.reloadListView()
            
        } else {
            
            isNameSort = .descend
            store.filter(nameBy: .descend)
            delegate.reloadListView()
            
        }
        
    }
    
}

//MARK: - Setup subviews for sorterview
extension SorterView {
    
    func createFadeView() {
        
        self.addSubview(fadeView)
        fadeView.frame = self.bounds
        fadeView.backgroundColor = UIColor.gray
        fadeView.alpha = 0.5
        
    }
    
    func createClearButton() {
        self.addSubview(clearButton)
        clearButton.frame = CGRect(x: self.bounds.width * 0.05, y: self.bounds.height * 0.1, width: self.bounds.width * 0.9, height: self.bounds.height * 0.1)
        clearButton.setTitle("Clear", for: .normal)
        clearButton.addTarget(self, action: #selector(clearButtonAction), for: .touchUpInside)
        
    }
    
    func createSortFemaleButton() {
        self.addSubview(sortFemaleButton)
        sortFemaleButton.frame = CGRect(x: self.bounds.width * 0.05, y: self.bounds.height * 0.25, width: self.bounds.width * 0.9, height: self.bounds.height * 0.1)
        sortFemaleButton.setTitle("Female", for: .normal)
        sortFemaleButton.addTarget(self, action: #selector(sortFemaleButtonAction), for: .touchUpInside)
        
    }
    func createSortMaleButton() {
        self.addSubview(sortMaleButton)
        sortMaleButton.frame = CGRect(x: self.bounds.width * 0.05, y: self.bounds.height * 0.4, width: self.bounds.width * 0.9, height: self.bounds.height * 0.1)
        sortMaleButton.setTitle("Male", for: .normal)
        sortMaleButton.addTarget(self, action: #selector(sortMaleButtonAction), for: .touchUpInside)
        
    }
    func createAgeButton() {
        self.addSubview(ageButton)
        ageButton.frame = CGRect(x: self.bounds.width * 0.05, y: self.bounds.height * 0.55, width: self.bounds.width * 0.9, height: self.bounds.height * 0.1)
        ageButton.setTitle("Age", for: .normal)
        ageButton.addTarget(self, action: #selector(ageButtonAction), for: .touchUpInside)
        
    }
    func createNameButton() {
        self.addSubview(nameButton)
        nameButton.frame = CGRect(x: self.bounds.width * 0.05, y: self.bounds.height * 0.7, width: self.bounds.width * 0.9, height: self.bounds.height * 0.1)
        nameButton.setTitle("Name", for: .normal)
        nameButton.addTarget(self, action: #selector(nameButtonAction), for: .touchUpInside)
        
    }

}


