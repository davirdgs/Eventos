//
//  CalendarEvent.swift
//  StaffManager
//
//  Created by Davi Rodrigues on 14/07/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import Foundation

class CalendarEvent {
    let title           : String
    let day             : Int
    let startHour       : Int
    let durationInHours : Int
    
    init(title: String, day: Int, startHour: Int, durationInHours: Int) {
        self.title = title
        self.day = day
        self.startHour = startHour
        self.durationInHours = durationInHours
    }
}