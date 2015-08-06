//
//  ParceModel.swift
//  StaffManager
//
//  Created by Davi Rodrigues on 30/07/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit
import Parse
import Foundation

class ParceModel {
   
    func saveEventInClound(eventName: String, withStart start: Int, andDuration duration: Int) {
        
        var newEvent = PFObject(className:"Event")
        newEvent["name"] = eventName
        newEvent["start"] = start
        newEvent["duration"] = duration
        newEvent.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
                NSLog("Saved!")
            } else {
                // There was a problem, check error.description
                NSLog("Error! \(error?.description)")
            } // end if-then-else
        } // end saveInBackgroundWithBlock
        
    } // end func
    
    func fetchEvent() -> NSMutableArray{
        
        let array = NSMutableArray()
        
        return array
    }
    
} // end class
