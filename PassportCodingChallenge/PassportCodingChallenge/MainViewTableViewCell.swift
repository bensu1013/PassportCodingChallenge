//
//  MainViewTableViewCell.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/14/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import UIKit

class MainViewTableViewCell: UITableViewCell {
    
    var cellView = UIView()
    var profileImage = UIImageView()
    var uidLabel = UILabel()
    var nameLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCellData(with profile: UserProfile) {
        
        uidLabel.text = "User ID: \(profile.uid)"
        nameLabel.text = "Name: \(profile.name)"
        cellView.backgroundColor = profile.backgroundColor
                
    }

}

//MARK: - Create tableview cell subviews and constraints
extension MainViewTableViewCell {
    
    func setupSubviews() {
        
        createSubviews()
        constrainSubviews()
        
    }
    
    func createSubviews() {
        
        self.contentView.addSubview(cellView)
        self.cellView.addSubview(profileImage)
        self.cellView.addSubview(uidLabel)
        self.cellView.addSubview(nameLabel)
        
        cellView.layer.cornerRadius = 7
        
    }
    
    func constrainSubviews() {
        
        constrainCellView()
        constrainProfileImageLabel()
        constrainUIDLabel()
        constrainNameLabel()
        
    }
    
    func constrainCellView() {
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        
    }
    
    func constrainProfileImageLabel() {
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 0).isActive = true
        profileImage.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 0).isActive = true
        profileImage.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 1).isActive = true
        profileImage.widthAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 1).isActive = true
        
        
    }
    
    func constrainUIDLabel() {
        
        uidLabel.translatesAutoresizingMaskIntoConstraints = false
        uidLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 0).isActive = true
        uidLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: 0).isActive = true
        uidLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 0).isActive = true
        uidLabel.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 0.3).isActive = true
        
    }
    
    func constrainNameLabel() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 0).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: 0).isActive = true
        nameLabel.topAnchor.constraint(equalTo: uidLabel.bottomAnchor, constant: 0).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: 0).isActive = true
        
    }
    
}













