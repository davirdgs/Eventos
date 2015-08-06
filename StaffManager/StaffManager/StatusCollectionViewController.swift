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
    let titles = [NSLocalizedString("OK", comment:"string for registration"), NSLocalizedString("Need people", comment:"string for status"), NSLocalizedString("To much people", comment:"string for planning"), NSLocalizedString("Need material", comment:"string for maps")]
    //let titles: [String] = ["Credenciamento","Status","Planejamento", "Mapas"]
    
    let images: [String] = ["okStatus","missing","crowd","box"];

    
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
            playNotification("okStatus")
            break
        case 1:
            playNotification("missing")
            break
        case 2:
            playNotification("crowd")
            break
        case 3:
            playNotification("box")
            break
        default:
            print(indexPath.row)
        }
    }
    
    func playNotification(imageName: String) {
        
        let randomNum = CGFloat(arc4random_uniform(500) + 100)
        var imageBackground = UIImageView(frame: CGRectMake(30, randomNum, 50, 50))
        imageBackground.image = UIImage(named: imageName)
        self.view.addSubview(imageBackground)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            imageBackground.frame = CGRectMake(200, randomNum, 50, 50)
            self.view.layoutIfNeeded()
            
            }, completion: { (result) -> Void in
                imageBackground.removeFromSuperview()
        })
        
    }
}














