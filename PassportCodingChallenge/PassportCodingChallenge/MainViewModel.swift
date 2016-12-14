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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareTableView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataOrganizer.shared.peekProfiles().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        cell.backgroundColor = UIColor.cyan
        cell.textLabel?.text = "\(DataOrganizer.shared.peekProfiles()[indexPath.row].uid)"
        
        return cell
        
    }
    
    
    
}
