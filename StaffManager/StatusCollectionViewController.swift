//
//  StatusCollectionViewController.swift
//  StaffManager
//
//  Created by Davi Rodrigues on 13/07/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit

//let reuseIdentifier = "Cell"

class StatusCollectionViewController: UICollectionViewController {
    
    let sectionInserts = UIEdgeInsets(top: 25.0, left: 10.0, bottom: 10.0, right: 10.0)
    let titles: [String] = ["Status1","Status2","Status3", "Status4"]
    let images: [String] = ["StatusImage1", "StatusImage2", "StatusImage3", "StatusImage4"]

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
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

}
