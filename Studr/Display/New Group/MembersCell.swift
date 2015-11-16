//
//  MembersCell.swift
//  Studr
//
//  Created by Joshua Herkness on 11/15/15.
//  Copyright © 2015 JJR. All rights reserved.
//

import Foundation
import UIKit
import Eureka
import Parse

public class MembersCell : Cell<Set<PFUser>>, CellType {
    
    public var imagePadding: CGFloat = 5.0
    
    required public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    public override func setup() {
        super.setup()
        
    }
    
    public override func update() {
        super.update()
        
        // Convert the members set to a
        let membersSet = row.value
        var members:[PFUser] = []
        for var member:PFUser in membersSet!{
            members.append(member)
        }
        
        // Calculate frame values
        let viewWidth:CGFloat = self.contentView.frame.size.width
        let viewHeight:CGFloat = self.contentView.frame.size.height
        let imageWidth:CGFloat = viewHeight  - 2*(imagePadding)
        let imageHeight:CGFloat = imageWidth
        
        let maxMembersDisplayed:Int = Int(floor(viewWidth / (imagePadding + imageWidth)))
        let membersDisplayed = members.count <= maxMembersDisplayed ? members.count : maxMembersDisplayed
        let membersNotDisplayed = members.count <= maxMembersDisplayed ? 0 : members.count - maxMembersDisplayed
        
        // Creates the members profiles
        for var i = 0; i < membersDisplayed; i++ {
            // Member at index of dataset
            let member:PFUser = members[i]
            
            // Create label
            let frame: CGRect = CGRect(x: imagePadding*(CGFloat(i+1)) + imageWidth*(CGFloat(i)), y: imagePadding, width: imageWidth, height: imageHeight)
            let label = UILabel(frame: frame)
            label.backgroundColor = STColor.red()
            label.text = member.valueForKey("username") as? String ?? "Hello"
            self.contentView.addSubview(label)
        }
        
        // Creates aditional members notification
        if membersNotDisplayed > 0 {
            
            // Create notification label
            let frame: CGRect = CGRect(x: imagePadding*(CGFloat(membersDisplayed+1)) + imageWidth*(CGFloat(membersDisplayed)), y: imagePadding, width: imageWidth, height: imageHeight)
            let label = UILabel(frame: frame)
            label.text = "\(membersNotDisplayed)"
            self.contentView.addSubview(label)
        }
    }
    
    func valueChanged() {
        
    }
}


public final class MembersRow: Row<Set<PFUser>, MembersCell>, RowType {
    
    required public init(tag: String?) {
        super.init(tag: tag)

        displayValueFor = nil
        cellProvider = CellProvider<MembersCell>()
    }
}