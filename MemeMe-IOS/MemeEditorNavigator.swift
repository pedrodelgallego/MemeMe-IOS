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
