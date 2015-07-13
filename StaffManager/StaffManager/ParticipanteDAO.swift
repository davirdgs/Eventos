//
//  ParticipanteDAO.swift
//  StaffManager
//
//  Created by Jose Luis Hinostroza on 7/7/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import Foundation
import CoreData

class ParticipanteDAO{
    
    static func insert(objectToBeInserted:Participante)
    {
        // insert element into context
        DataBaseManager.sharedInstance.managedObjectContext?.insertObject(objectToBeInserted)
        
        // save context
        var error:NSErrorPointer = nil
        DataBaseManager.sharedInstance.managedObjectContext?.save(error)
        if (error != nil)
        {
            // log error
            print(error)
        }
        else{
            println("Participante inserido na DB")
        }
        
    }
    
    static func delete(objectToBeDeleted:Participante)
    {
        // remove object from context
        var error:NSErrorPointer = nil
        DataBaseManager.sharedInstance.managedObjectContext?.deleteObject(objectToBeDeleted)
        DataBaseManager.sharedInstance.managedObjectContext?.save(error)
        
        // log error
        if (error != nil)
        {
            // log error
            print(error)
        }
    }
    
    static func getAllParticipants() -> [Participante]
    {
     
        let request  = NSFetchRequest(entityName: "Participante")
        
        
        //let allParticipants = [Participante]()
        var error:NSErrorPointer = nil
        
        let results:[Participante] = DataBaseManager.sharedInstance.managedObjectContext?.executeFetchRequest(request, error: error) as! [Participante]


        
        return results
    }
    
}