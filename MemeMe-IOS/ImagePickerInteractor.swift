import UIKit

class ImagePickerInteractor: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    weak var parentViewController: MemeEditorViewController!
    let imagePicker = UIImagePickerController()
    
    init(parentViewController: MemeEditorViewController){
        super.init()
        self.parentViewController = parentViewController
        imagePicker.delegate = self
    }
    
    // MARK: Delegate methods
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        parentViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            parentViewController.imageView.image = image
        }
        parentViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: User Interactions
    func pickAPicture(){
        imagePicker.sourceType = .PhotoLibrary
        showViewImagePickerController()
    }
    
    func takeAPicture() {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
            imagePicker.sourceType = .Camera
            showViewImagePickerController()
        } else {
            cameraNotAvailable()
        }
    }
    
    func cameraNotAvailable(){
        var alert = UIAlertController(title: "Camera is not available", message: "The camera is not available while using the simulator, please deploy de application in your device", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
        parentViewController.presentViewController(alert, animated: true){ }
    }
    
    func showViewImagePickerController(){
        parentViewController.presentViewController(imagePicker, animated: true, completion: nil)
    }
}

