//
//  DetailView.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/14/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit

class DetailView: UIView {
    
    var profileImage = UIImageView()
    var uidLabel = UILabel()
    var nameLabel = UILabel()
    var genderLabel = UILabel()
    var ageLabel = UILabel()
    var hobbiesText = UITextView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}








