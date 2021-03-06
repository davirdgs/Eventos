//
//  Participante.swift
//  StaffManager
//
//  Created by Jose Luis Hinostroza on 7/7/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import Foundation
import CoreData

class Participante: NSManagedObject {

    @NSManaged var tipoParticipante: String
    @NSManaged var nomeParticipante: String
    @NSManaged var emailParticipante: String
    @NSManaged var photoParticipante: NSData

    /// The designated initializer
    convenience init()
    {
        // get context
        let context:NSManagedObjectContext = DataBaseManager.sharedInstance.managedObjectContext!
        
        // create entity description
        let entityDescription:NSEntityDescription? = NSEntityDescription.entityForName("Participante", inManagedObjectContext: context)
        
        // call super using
        self.init(entity: entityDescription!, insertIntoManagedObjectContext: context)
    }
    
}
