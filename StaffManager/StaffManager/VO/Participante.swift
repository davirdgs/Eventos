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

}
