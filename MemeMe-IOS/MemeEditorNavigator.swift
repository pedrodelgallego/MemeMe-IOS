//
//  MemeEditorNavigator.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 04/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit

class MemeEditorNavigator {
    let view: MemeEditorViewController
    let imagePicker = UIImagePickerController()
    
    init(view: MemeEditorViewController) {
        self.view = view
    }
    
    func presentActivity(meme: Meme){
        let activityViewController = UIActivityViewController(activityItems: [meme.memedImage], applicationActivities: [])
        
        view.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    func presentImagePicker(delegate: MemeEditorPresenter, sourceType: UIImagePickerControllerSourceType){
        imagePicker.delegate = delegate
        imagePicker.sourceType = sourceType
        view.presentViewController(imagePicker, animated: true, completion: nil)
    }
}
