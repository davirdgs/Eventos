//
//  CalendarEventCell.swift
//  StaffManager
//
//  Created by Davi Rodrigues on 14/07/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit
import Sapporo

class CalendarEventCellModel: SACellModel {
    let event: CalendarEvent
    
    init(event: CalendarEvent, selectionHandler: SASelectionHandler) {
        self.event = event
        super.init(cellType: CalendarEventCell.self, selectionHandler: selectionHandler)
    }
}

class CalendarEventCell: SACell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0, green: 0, blue: 0.7, alpha: 1).CGColor
    }
    
    override func configure(cellmodel: SACellModel) {
        super.configure(cellmodel)
        
        if let cellmodel = cellmodel as? CalendarEventCellModel {
            titleLabel.text = cellmodel.event.title
        }
    }
    
}
