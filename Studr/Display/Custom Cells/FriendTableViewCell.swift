//
//  FriendTableViewCell.swift
//  Studr
//
//  Created by Robin Onsay on 11/8/15.
//  Copyright © 2015 JJR. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class FriendTableViewCell: PFTableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    private var user : PFUser!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUser(user: PFUser){
        self.user = user
        
        // Set the profile image
        profileImageView.image = imageFromString(user.email!, size: CGSizeMake(80, 80))
        profileImageView.layer.cornerRadius = 4.0
        profileImageView.clipsToBounds = true
        
        // Set the name label
        let firstName = user["firstName"] as? String
        let lastName = user["lastName"] as? String
        nameLabel.text = firstName! + " " + lastName!
        
        // Set the username label
        usernameLabel.text = user.username
    }
}
