//
//  AboutViewController.swift
//  Studr
//
//  Created by Joshua Herkness on 11/28/15.
//  Copyright © 2015 JJR. All rights reserved.
//

import Foundation
import UIKit
import Eureka

class AboutViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Edit navigation bar apearence
        self.navigationController?.navigationBar.barTintColor = Constants.Color.secondary
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.title = "About"
        
        // Add back button
        let image = UIImage(named: "ic_chevron_left")
        let button = UIBarButtonItem(image: image, style: .Plain, target: self, action: "back:")
        navigationItem.leftBarButtonItem = button
        
        // Modify default TextRow apearence
        TextRow.defaultCellUpdate = {cell, row in
            cell.tintColor = Constants.Color.secondary
            cell.textField.textAlignment = .Left
        }
        
        // Create Form
        form +++ Section("Created by")
            <<< TextRow() {
                $0.title = "Joshua Herkness"
                $0.disabled = true
            } <<< TextRow() {
                $0.title = "Joseph Herkness"
                $0.disabled = true
            } <<< TextRow() {
                $0.title = "Robin Onsay"
                $0.disabled = true
        }
        form +++ Section("")
            <<< TextRow("versionNumber") {
                $0.title = "Version Number"
                $0.value = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as? String
                $0.disabled = true
                $0.cell.textField.textAlignment = .Right
                }.cellUpdate { cell, row in
                    cell.textField.textAlignment = .Right
        }
        form +++ Section("")
            <<< ButtonRow("libraries") {
                $0.title = "Libraries"
                $0.presentationMode = .Show(controllerProvider: ControllerProvider.Callback { return LibrarriesViewController() }, completionCallback: { vc in vc.navigationController?.popViewControllerAnimated(true) })
        }
        
    }
    
    // MARK: Actions
    
    func back(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}