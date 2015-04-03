//
//  SentMemeInteractor.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 03/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit

class SentMemeInteractor: NSObject, UITableViewDelegate, UICollectionViewDelegate {
    var parentViewController: UIViewController
    
    init(parentViewController: UIViewController){
        self.parentViewController = parentViewController
    }
    
    // MARK: Helpers
    func showMeme(meme: Meme){
        var vc: MemeViewController = parentViewController.storyboard?.instantiateViewControllerWithIdentifier("MemeVC") as! MemeViewController
        
        vc.meme = meme
        
        self.parentViewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    // Mark: UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let meme = Meme.collection[indexPath.row]
        showMeme(meme)
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        let meme = Meme.collection[indexPath.row]
        showMeme(meme)
    }
}
