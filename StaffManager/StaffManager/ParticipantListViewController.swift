//
//  ParticipantListViewController.swift
//  StaffManager
//
//  Created by Jose Luis Hinostroza on 7/13/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit

class ParticipantListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var participantList = [Participante]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Obtemos a lista dos participantes cadastrados
        participantList = ParticipanteServices.getAllParticipantes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return participantList.count
    }

    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        //Mostramos o nome e email
        cell.textLabel?.text = participantList[indexPath.row].nomeParticipante
        cell.detailTextLabel?.text = participantList[indexPath.row].emailParticipante

        return cell
    }

}
