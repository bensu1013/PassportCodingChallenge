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
fileprivate let segueIdentifier = "profileDetailSegue"

protocol MainTableViewDelegate: class {
    
    func segueAction()
    
}

class MainTableViewModel: UIView {
    
    var tableView = UITableView()
    var tempid = 0
    var delegate: MainTableViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        prepareTableView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



//MARK: - Tableview protocol methods and preparations
extension MainTableViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func prepareTableView() {
        
        self.addSubview(tableView)
        tableView.frame = self.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainViewTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = UIColor.clear
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.bounds.height / 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataOrganizer.shared.peekProfiles.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MainViewTableViewCell
        
        let user = DataOrganizer.shared.peekProfiles[indexPath.row]
        
        cell.populateCellData(with: user)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate.segueAction()
        
    }
    
    
}
