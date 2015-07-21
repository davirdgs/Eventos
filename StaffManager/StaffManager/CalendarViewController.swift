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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sapporo.delegate = self
        sapporo.registerNibForClass(CalendarEventCell)
        sapporo.registerNibForSupplementaryClass(CalendarHeaderView.self, kind: CalendarHeaderType.Day.rawValue)
        sapporo.registerNibForSupplementaryClass(CalendarHeaderView.self, kind: CalendarHeaderType.Hour.rawValue)
        
        let layout = CalendarLayout()
        sapporo.setLayout(layout)
        
        let randomEvent = { () -> CalendarEvent in
            let randomID = arc4random_uniform(10000)
            let title = "Event \(randomID)"
            
            let randomDay = Int(arc4random_uniform(1))
            let randomStartHour = Int(arc4random_uniform(20))
            let randomDuration = Int(arc4random_uniform(5) + 1)
            
            return CalendarEvent(title: title, day: randomDay, startHour: randomStartHour, durationInHours: randomDuration)
        }
        
        let cellmodels = (0...10).map { _ -> CalendarEventCellModel in
            let event = randomEvent()
            return CalendarEventCellModel(event: event) { _ in
                println("Selected event: \(event.title)") //Dispara açao do evento
            }
        }
        
        sapporo[0].append(cellmodels)
        sapporo.bump()

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
        view.titleLabel.text = "Hour \(indexPath.item + 1)"
        return view
    }
}