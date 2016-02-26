//
//  GroupCell.swift
//  Studr
//
//  Created by Joseph Herkness on 2/14/16.
//  Copyright © 2016 JJR. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class GroupCell: UICollectionViewCell {
    
    // MARK: Instance Variables
    
    var nameLabel: UILabel!
    
    // UICollectionViewCell
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupCell()
    }
    
    func setupCell(){
        
        backgroundColor = UIColor.whiteColor()
        layer.cornerRadius = 5.0
        
        nameLabel = UILabel()
        nameLabel.textColor = UIColor(hexString: "3D4247")
        nameLabel.font = UIFont.systemFontOfSize(17)
        addSubview(nameLabel)
        
        // Setup the selected background view
        let view: UIView = UIView()
        view.backgroundColor = UIColor(hexString: "F4F5F6")
        selectedBackgroundView = view
        
        updateConstraints()
    }
    
    override func updateConstraints() {
        nameLabel.snp_makeConstraints(closure: { make in
            make.center.equalTo(self)
        })
        
        super.updateConstraints()
    }
    
    func configureCell(group: Group){
        nameLabel.text = group.name
        
    }
}