//
//  SorterView.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/15/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit


class SorterView: UIView {
    
    var fadeView = UIView()
    var clearButton = UIButton()
    var genderButton = UIButton()
    var ageButton = UIButton()
    var nameButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createFadeView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createFadeView() {
        
        self.addSubview(fadeView)
        fadeView.frame = self.bounds
        fadeView.backgroundColor = UIColor.gray
        fadeView.alpha = 0.5
        
    }
    
}





