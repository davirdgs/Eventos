//
//  ParticipanteServices.swift
//  StaffManager
//
//  Created by Jose Luis Hinostroza on 7/7/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import Foundation

class ParticipanteServices
{
    static func createParticipante(tipo:String, name:String, email:String, photo: NSData)
    {
        var participante:Participante = Participante()
        participante.tipoParticipante = tipo
        participante.nomeParticipante = name
        participante.emailParticipante = email
        participante.photoParticipante = photo
        
        // insert it
        ParticipanteDAO.insert(participante)
    }

    static func getAllParticipantes() -> [Participante]
    {
        let allParticipants = ParticipanteDAO.getAllParticipants()
        
        if(allParticipants.count == 0){
            NSLog("Sem participantes no coredata")
        }
        
        return allParticipants        

    }

    
}