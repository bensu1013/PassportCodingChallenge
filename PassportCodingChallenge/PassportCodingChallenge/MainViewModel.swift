//
//  MainViewModel.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/13/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit

fileprivate let reuseIdentifier = "profileCell"

class MainViewModel: UIView {
    
    var tableView = UITableView()
    var tempid = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareTableView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        tempid = Int(arc4random())
        
        fakeData["uid"] = tempid
        
        FirebaseAPI.addProfile(profile: UserProfile(data: fakeData))
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        FirebaseAPI.removeProfile(id: tempid)
        
    }
    
}



//MARK: - Tableview protocol methods and preparations
extension MainViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func prepareTableView() {
        
        self.addSubview(tableView)
        tableView.frame = self.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = UIColor.blue
        tableView.isUserInteractionEnabled = false
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataOrganizer.shared.peekProfiles().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        let user = DataOrganizer.shared.peekProfiles()[indexPath.row]
        
        cell.backgroundColor = user.backgroundColor
        cell.textLabel?.text = "\(user.uid)"
        
        return cell
        
    }
    
    
    
}
