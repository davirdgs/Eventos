//
//  StatusCollectionViewController.swift
//  StaffManager
//
//  Created by Davi Rodrigues on 15/07/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit

//let reuseIdentifier = "Cell"

class StatusCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let sectionInserts = UIEdgeInsets(top: 25.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    // i8n
    let titles = [NSLocalizedString("Registration", comment:"string for registration"), NSLocalizedString("Status", comment:"string for status"), NSLocalizedString("Planning", comment:"string for planning"), NSLocalizedString("Maps", comment:"string for maps")]
    //let titles: [String] = ["Credenciamento","Status","Planejamento", "Mapas"]
    
    let images: [String] = ["StatusImage1","StatusImage2","StatusImage3","StatusImage4"];

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return self.titles.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionMenuCell
        
        cell.title.text = self.titles[indexPath.row]
        cell.pinImage.image = UIImage(named: self.images[indexPath.row])
        
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        switch(indexPath.row) {
        case 0:
            playNotification("StatusImage1")
            break
        case 1:
            playNotification("StatusImage2")
            break
        case 2:
            playNotification("StatusImage3")
            break
        case 3:
            playNotification("StatusImage4")
            break
        default:
            print(indexPath.row)
        }
    }
    
    func playNotification(imageName: String) {
        
        var imageBackground = UIImageView(frame: CGRectMake(30, 200, 30, 30))
        imageBackground.image = UIImage(named: imageName)
        self.view.addSubview(imageBackground)
        
        /*
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            }, completion: { (result) -> Void in {
                
                }
            })
*/
    }
}














