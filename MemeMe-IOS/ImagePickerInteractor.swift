import UIKit

class ImagePickerInteractor: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var parentViewController: MemeEditorViewController!
    
    init(parentViewController: MemeEditorViewController){
        self.parentViewController = parentViewController
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        parentViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            parentViewController.imageView.image = image
        }
        parentViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func pickAPicture(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        parentViewController.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
}

