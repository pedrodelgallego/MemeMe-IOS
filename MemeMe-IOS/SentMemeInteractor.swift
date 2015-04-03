//
//  SentMemeInteractor.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 03/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit

class SentMemeInteractor: NSObject, UITableViewDelegate {
    var parentViewController: UIViewController
    
    init(parentViewController: UIViewController){
        self.parentViewController = parentViewController
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var vc: MemeViewController = parentViewController.storyboard?.instantiateViewControllerWithIdentifier("MemeVC") as! MemeViewController

        vc.meme = Meme.collection[indexPath.row]
        
        self.parentViewController.navigationController?.pushViewController(vc, animated: true)
    }
}
