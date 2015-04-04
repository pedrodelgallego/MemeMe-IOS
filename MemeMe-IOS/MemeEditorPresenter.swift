import UIKit

class MemeEditorPresenter: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    weak var view: MemeEditorViewController!
    let navigator: MemeEditorNavigator!

    init(view: MemeEditorViewController){
        self.view = view
        self.navigator = MemeEditorNavigator(view: view)
    }
    
    // MARK: Share Meme
    func shareMeme() {
        let meme = Meme(topText: view.topTextField.text, bottomText: view.bottomTextField.text, imageView: view.imageView)
        meme.generateImage(view.MemeEditorView)
        meme.save()
        
        navigator.presentActivity(meme)
    }
    
    // MARK: Delegate methods
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        view.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            view.imageView.image = image
        }
        view.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: User Interactions
    func pickAPicture(){
        self.navigator.presentImagePicker(self, sourceType: UIImagePickerControllerSourceType.PhotoLibrary)
    }
    
    func takeAPicture() {
        if(UIImagePickerController.isSourceTypeAvailable(.Camera)){
            navigator.presentImagePicker(self, sourceType: .Camera)
        } else {
            cameraNotAvailable()
        }
    }
    
    func cameraNotAvailable(){
        var alert = UIAlertController(title: "Camera is not available", message: "The camera is not available while using the simulator, please deploy de application in your device", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
        view.presentViewController(alert, animated: true){ }
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
        view.view.frame.origin.y += getKeyboardHeight(notification)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        view.view.frame.origin.y -= getKeyboardHeight(notification)
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.CGRectValue().height
    }
}
