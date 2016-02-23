//
//  Constants.swift
//  Studr
//
//  Created by Joseph Herkness on 12/6/15.
//  Copyright © 2015 JJR. All rights reserved.
//

import UIKit
import Firebase

struct Constants {
    
    struct Color {
        
        // Colors
        static let red = UIColor(hexString: "F54A4A")
        static let lightGrey = UIColor(hexString: "EFEFF4")
        static let grey = UIColor(hexString: "DEE0E4")
        static let darkGrey = UIColor(hexString: "353535")
        
        // Theme colors
        static let primary = UIColor(hexString: "4A90E3") // F3B74A
        static let lightGreyBackground = UIColor(hexString: "ECEEEF")
        
        // Tab colors
        static let barTintColor = UIColor(hexString: "F6F8FA")
        static let selectedTabColor = UIColor(hexString: "4A90E3")
        static let deselectedTabColor = UIColor(hexString: "8B9399")
        
    }
    
    static let userCellHeight: CGFloat = 56.0
}
