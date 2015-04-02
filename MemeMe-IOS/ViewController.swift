//
//  ViewController.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 02/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var MemeEditorView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    let memeEditorTextField = MemeEditorTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeEditorTextField.configTextField(topTextField, text: "TOP")
        memeEditorTextField.configTextField(bottomTextField, text: "BOTTOM")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func shareMeme(sender: UIBarButtonItem) { }
    
    @IBAction func cancel(sender: UIBarButtonItem) { }
    
    @IBAction func pickAPicture(sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func takeAPicture(sender: UIBarButtonItem) { }
    
    // PRAGMA: UIImagePickerControllerDelegate,UINavigationControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = image
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

