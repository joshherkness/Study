//
//  PushUpSegue.swift
//  Studr
//
//  Created by Joseph Herkness on 11/7/15.
//  Copyright © 2015 JJR. All rights reserved.
//

import UIKit

class PushUpSegue: UIStoryboardSegue {
    
    override func perform() {
        // Assign the source and destination views to local variables.
        let firstVCView : UIView
        if(self.sourceViewController.navigationController != nil){
            firstVCView = self.sourceViewController.navigationController!.view as UIView!
        }else{
            firstVCView = self.sourceViewController.view as UIView!
        }
        let secondVCView = self.destinationViewController.view as UIView!
        
        // Get the screen width and height.
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        // Specify the initial position of the destination view.
        secondVCView.frame = CGRectMake(0.0, screenHeight, screenWidth, screenHeight)
        
        // Access the app's key window and insert the destination view above the current (source) one.
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(secondVCView, aboveSubview: firstVCView)
        
        // Animate the transition.
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, -screenHeight)
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0.0, -screenHeight)
            
            }) { (Finished) -> Void in
                self.sourceViewController.presentViewController(self.destinationViewController as UIViewController,
                    animated: false,
                    completion: nil)
        }
        
    }

}
