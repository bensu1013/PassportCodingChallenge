//
//  ViewController.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/13/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let user = UserProfile(uid: 12345, gender: "Male", name: "Greg", age: 43, hobbies: "Hola Hoop", image: UIImage(), backgroundColor: UIColor.blue)
        FirebaseAPI.addProfile(profile: user)
        FirebaseAPI.streamList { (data) in
            dump(data)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let user = UserProfile(uid: 5312, gender: "Male", name: "Greg", age: 43, hobbies: "Hola Hoop", image: UIImage(), backgroundColor: UIColor.blue)
        FirebaseAPI.addProfile(profile: user)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        FirebaseAPI.removeProfile(id: 5312)
        
    }

}

