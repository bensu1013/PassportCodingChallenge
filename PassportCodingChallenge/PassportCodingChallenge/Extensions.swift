//
//  Extensions.swift
//  PassportCodingChallenge
//
//  Created by Benjamin Su on 12/14/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func convert(from hex: Int) -> UIColor {
        
        let red = CGFloat((hex >> 16) & 0xff) / 255
        let green = CGFloat((hex >> 8) & 0xff) / 255
        let blue = CGFloat(hex & 0xff) / 255
        return UIColor.init(red: red, green: green, blue: blue, alpha: 1.0)
        
    }
    
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
       // if (cString.hasPrefix("0x")) {
      //      cString.remove(at: cString.startIndex)
      //  }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue >> 16) & 0xff) / 255.0,
            green: CGFloat((rgbValue >> 8) & 0xff) / 255.0,
            blue: CGFloat(rgbValue & 0xff) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func getHexString() -> String {
        
        var hexString = ""
        
        if let obj = self.cgColor.components {
            
            dump(obj)
            
            hexString += "0x"
            
            let red = Int(obj[0] * 255)
            let green = Int(obj[1] * 255)
            let blue = Int(obj[2] * 255)
            
            hexString += changeHexToString(with: red)
            hexString += changeHexToString(with: green)
            hexString += changeHexToString(with: blue)
            
        }
        
        return hexString
        
    }
    
    private func changeHexToString(with num: Int) -> String {
        
        var hexString = "\(num)"
        
        if hexString.characters.count == 1 {
            
            hexString = "0\(num)"
            return hexString
            
        } else {
            
            return hexString
            
        }
        
    }
    
}
