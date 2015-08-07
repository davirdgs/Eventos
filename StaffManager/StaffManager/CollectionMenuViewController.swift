//
//  CollectionMenuViewController.swift
//  StaffManager
//
//  Created by Davi Rodrigues on 07/07/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit

let reuseIdentifier = "menuCell"

class CollectionMenuViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let sectionInserts = UIEdgeInsets(top: 25.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    //i18n
    let titles = [NSLocalizedString("Registration", comment:"string for registration"),
                    NSLocalizedString("Status", comment:"string for status"),
                    NSLocalizedString("Planning", comment:"string for planning"),
                    NSLocalizedString("Maps", comment:"string for maps")]
    
    //Nomes das imagens
    let images: [String] = ["Cadastro","Notificacao","tasks","Mapa-1"]


    override func viewDidLoad() {
        super.viewDidLoad()

        ParceModel.initEventList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func returnToMenu (segue: UIStoryboardSegue)
    {
        
    }

    //Numero de seções da collectionview menu
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }

    
    //Numero de elemento igual ao numero de titles
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return self.titles.count
    }

    //Instancia celulas
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionMenuCell
        
        cell.title.text = self.titles[indexPath.row]
        cell.pinImage.image = UIImage(named: self.images[indexPath.row])
        
        return cell
    }
    
    //
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        switch(indexPath.row) {
        case 0:
            performSegueWithIdentifier("toAccreditation", sender: self)
            break
        case 1:
            performSegueWithIdentifier("toStatus", sender: self)
            break
        case 2:
            performSegueWithIdentifier("toPlan", sender: self)
            break
        case 3:
            performSegueWithIdentifier("toMaps", sender: self)
            break
        default:
            print(indexPath.row)
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "headerMenu", forIndexPath: indexPath) as! HeaderMenuView
            return headerView
        case UICollectionElementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "footerMenu", forIndexPath: indexPath) as! FooterMenuView
            return footerView
        default:
            assert(false, "Unexpected element kind")
        }
        
    }
    


}
