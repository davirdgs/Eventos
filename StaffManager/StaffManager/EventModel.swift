//
//  EventModel.swift
//  StaffManager
//
//  Created by Davi Rodrigues on 07/08/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit
import Parse

class EventModel: PFObject, PFSubclassing {
    
    @NSManaged var eventName: String
    @NSManaged var eventDuration: Int
    @NSManaged var eventStart: Int
   
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Event"
    }
    
}
