//
//  ListNavBar.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/15/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit

protocol ListNavBarDelegate: class {
    
    func addButtonTapped()
    func sortButtonTapped()
    
}

class ListNavBar: UIView {

    var addButton = UIButton()
    var sortButton = UIButton()
    weak var delegate: ListNavBarDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtonAction() {
        
        delegate.addButtonTapped()
        
    }
    
    func sortButtonAction() {
        
        delegate.sortButtonTapped()
        
    }
    
}

//MARK: - Setup Subviews
extension ListNavBar {
    
    func setupSubviews() {
        
        createAddButton()
        createSortButton()
    
    }
    

    
    func createAddButton() {
        
        self.addSubview(addButton)
        addButton.frame = CGRect(x: self.frame.width * 0.9, y: self.frame.height * 0.4, width: self.frame.height * 0.5, height: self.frame.height * 0.5)
        addButton.setTitle("➕", for: .normal)
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        
    }
    
    func createSortButton() {
        
         self.addSubview(sortButton)
        sortButton.frame = CGRect(x: self.frame.width * 0.8, y: self.frame.height * 0.4, width: self.frame.height * 0.5, height: self.frame.height * 0.5)
        sortButton.setTitle("🔀", for: .normal)
        sortButton.addTarget(self, action: #selector(sortButtonAction), for: .touchUpInside)
        
    }
    
    
}
