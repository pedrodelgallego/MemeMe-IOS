//
//  ShareMemeInteractor.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 04/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit

class ShareMemeInteractor {
    weak var parentViewController: MemeEditorViewController!
    
    init(parentViewController: MemeEditorViewController){
        self.parentViewController = parentViewController
    }
    
    func shareMeme(meme: Meme) {
        let activityViewController = UIActivityViewController(activityItems: [meme.memedImage], applicationActivities: [])
        
        parentViewController.presentViewController(activityViewController, animated: true, completion: nil)
    }
}