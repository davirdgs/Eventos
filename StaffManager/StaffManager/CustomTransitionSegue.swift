//
//  newCustomSegue.swift
//  StaffManager
//
//  Created by Davi Rodrigues on 07/07/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit

class CustomTransitionSegue: UIStoryboardSegue {
    
    override func perform() {
        
        let sourceView: UIView = (self.sourceViewController as! UIViewController).view
        let destinationView: UIView = (self.destinationViewController as! UIViewController).view
        
        let window = UIApplication.sharedApplication().keyWindow
        
        destinationView.center = CGPointMake(sourceView.center.x + sourceView.frame.size.width, destinationView.center.y)
        
        
        window?.insertSubview(destinationView, aboveSubview: sourceView)
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            destinationView.center = CGPointMake(sourceView.center.x, destinationView.center.y)
            sourceView.center = CGPointMake(0 - sourceView.center.x, destinationView.center.y)
            
            }, completion: {
                (result) -> Void in
                self.sourceViewController.presentViewController(self.destinationViewController as! UIViewController, animated: false, completion: nil)
        })
    }
   
}
