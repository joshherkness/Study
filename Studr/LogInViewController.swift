//
//  LogInViewController.swift
//  Studr
//
//  Created by Joshua Herkness on 10/31/15.
//  Copyright (c) 2015 Joshua Herkness. All rights reserved.
//

import UIKit
import Parse

class LogInViewController : UIViewController{
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Create activity indicator
        self.activityIndicator.center = self.view.center
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.activityIndicatorViewStyle = .Gray
        
        // Add activity indicator
        view.addSubview(self.activityIndicator)
        
        // Change the logo
        /*
        let logoView = UIImageView(image: UIImage(named:"logo.png"))
        logoView.contentMode = UIViewContentMode.ScaleAspectFit
        self.logInView!.logo = logoView
        */
        
    }
    
    // Mark: Actions

    @IBAction func loginAction(sender: AnyObject) {
        
        let username = self.usernameField.text!
        let password = self.passwordField.text!
        
        if username.utf16.count < 4 || password.utf16.count < 5 {
            
            let alertViewController = UIAlertController(title: "Invalid", message: "Username must be greater than 4 and password must be greater than 5", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default){ (action) in
                // ...
            }
            alertViewController.addAction(OKAction)
            self.presentViewController(alertViewController, animated: true, completion: nil)
    
        } else {
            
            self.activityIndicator.startAnimating()
            
            PFUser.logInWithUsernameInBackground(username, password: password, block: { (user, error) -> Void in
                
                self.activityIndicator.stopAnimating()
                
                if ((user) != nil) {
                    
                    // Launch user into main application
                    let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                    let mainViewController: UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("main")
                    
                    self.presentViewController(mainViewController, animated: true, completion: nil)
                    
                } else {
                    
                    // Error notification
                    let alertViewController = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .Alert)
                    let OKAction = UIAlertAction(title: "OK", style: .Default){ (action) in
                        //...
                    }
                    alertViewController.addAction(OKAction)
                    self.presentViewController(alertViewController, animated: true, completion: nil)
                    
                }
            })
        }
    }
    
    @IBAction func signUpAction(sender: AnyObject) {
        self.performSegueWithIdentifier("signup", sender: self)
    }
}