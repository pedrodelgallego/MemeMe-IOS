//
//  MemeDataSource.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 03/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import Foundation
import UIKit

class MemeDataSource: NSObject, UITableViewDataSource, UICollectionViewDataSource {
    
    // Mark: Reusable methods
    
    func numberOfItemsInCollection() -> Int{
        return Meme.collection.count
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfItemsInCollection()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = Meme.collection[indexPath.row].topText
        return cell
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInCollection()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("sentMemeItem", forIndexPath: indexPath) as! UICollectionViewCell
        
        let meme = Meme.collection[indexPath.item]
        let imageView = UIImageView(image: meme.image)
        cell.backgroundView = imageView
        
        return cell
    }
}