//
//  CalendarViewController.swift
//  StaffManager
//
//  Created by Davi Rodrigues on 14/07/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit
import Sapporo

enum CalendarHeaderType: String {
    case Day = "DayHeaderView"
    case Hour = "HourHeaderView"
}

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var insertButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    lazy var sapporo: Sapporo = { [unowned self] in
        return Sapporo(collectionView: self.collectionView)
    }()
    
    var cellModels: [CalendarEventCellModel] = (0...1).map {
        _ -> CalendarEventCellModel in
        let event = CalendarEvent(title: "", day: 2, startHour: 0, durationInHours: 1)
        return CalendarEventCellModel(event: event) {_ in print("")}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sapporo.delegate = self
        sapporo.registerNibForClass(CalendarEventCell)
        sapporo.registerNibForSupplementaryClass(CalendarHeaderView.self, kind: CalendarHeaderType.Day.rawValue)
        sapporo.registerNibForSupplementaryClass(CalendarHeaderView.self, kind: CalendarHeaderType.Hour.rawValue)
        
        let layout = CalendarLayout()
        sapporo.setLayout(layout)
        
        cellModels.removeAll(keepCapacity: true)
        
        sapporo[0].append(cellModels)
        sapporo.bump()

    }
    
    func addEvent(name: String, start: Int, duration: Int) {
        let event = CalendarEvent(title: name, day: 0, startHour: start, durationInHours: duration)
        
        let cellModels = (0...1).map { _ -> CalendarEventCellModel in
            return CalendarEventCellModel(event: event) { _ in
                println("Evento")
            }
            
        }
        
        sapporo[0].append(cellModels)
        sapporo.bump()
        print(name, start, duration)
        
    }

    @IBAction func returnToPlanning(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func toPlanningWithEvent(segue: UIStoryboardSegue) {
        
    }
    
    
    @IBAction func insertButtonHandler(sender: AnyObject) {
        performSegueWithIdentifier("toInsert", sender: AnyObject?())
    }

}

extension CalendarViewController: SapporoDelegate {
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if kind == CalendarHeaderType.Day.rawValue {
            let view = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: CalendarHeaderView.reuseIdentifier, forIndexPath: indexPath) as! CalendarHeaderView
            view.titleLabel.text = "Day \(indexPath.item + 1)"
            return view
        }
        
        let view = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: CalendarHeaderView.reuseIdentifier, forIndexPath: indexPath) as! CalendarHeaderView
        view.titleLabel.text = "\(indexPath.item + 1)h"
        return view
    }
}