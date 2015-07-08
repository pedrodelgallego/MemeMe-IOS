import UIKit

class MemeEditorPresenter: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    weak var view: MemeEditorViewController!
    
    let keyboardManager: MemeEditorKeywordManager
    var navigator: MemeEditorNavigator
    var interactor = MemeEditorInteractor()
    
    init(view: MemeEditorViewController){
        self.view = view
        navigator = MemeEditorNavigator(view: view)
        keyboardManager = MemeEditorKeywordManager(view: view)
    }
    
    // MARK: Share Meme
    func shareMeme() {
        let meme = interactor.saveMeme(view)
        navigator.presentActivity(meme)
    }
    
    // MARK: Delegate methods
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        view.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            view.imageView.image = image
            view.actionButton.enabled = true
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
        let alert = UIAlertController(title: "Camera is not available", message: "The camera is not available while using the simulator, please deploy de application in your device", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
        view.presentViewController(alert, animated: true){ }
    }
    
    // MARK: Notification Observers
    func subscribeToKeyboardNotifications() {
        keyboardManager.subscribeToKeyboardNotifications()
    }
    
    func unsubscribeFromKeyboardNotifications() {
        keyboardManager.unsubscribeFromKeyboardNotifications()
    }
}
