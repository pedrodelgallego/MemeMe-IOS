//
//  ViewController.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 02/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit

class MemeEditorViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var MemeEditorView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    let memeEditorTextField = MemeEditorTextField()
    var imagePickerInteractor: ImagePickerInteractor!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        memeEditorTextField.configTextField(topTextField, text: "TOP")
        memeEditorTextField.configTextField(bottomTextField, text: "BOTTOM")
        imagePickerInteractor = ImagePickerInteractor(parentViewController: self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.unsubscribeFromKeyboardNotifications()
    }

    // MARK: User actions
    @IBAction func shareMeme(sender: UIBarButtonItem) {
        let meme = Meme(topText: topTextField.text, bottomText: bottomTextField.text, imageView: imageView)
        meme.generateImage(MemeEditorView)
        meme.save()
        
        let activityViewController = UIActivityViewController(activityItems: [meme.memedImage], applicationActivities: [])
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        imageView.image = nil
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
    }
    
    @IBAction func pickAPicture(sender: UIBarButtonItem) {
        imagePickerInteractor.pickAPicture()
    }

    @IBAction func takeAPicture(sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
            imagePicker.sourceType = .Camera
            imagePicker.delegate = imagePickerInteractor
            self.presentViewController(imagePicker, animated: true, completion: nil)
        } else {
            cameraNotAvailable()
        }
    }
    
    func cameraNotAvailable(){
        var alert = UIAlertController(title: "Camera is not available", message: "The camera is not available while using the simulator, please deploy de application in your device", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
        self.presentViewController(alert, animated: true){ }
    }
    
    // MARK: Image picker delegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = image
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Notification Observers
    
    func subscribeToKeyboardNotifications(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name:
            UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name:
            UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y += getKeyboardHeight(notification)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        self.view.frame.origin.y -= getKeyboardHeight(notification)
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.CGRectValue().height
    }
}

