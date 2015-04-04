import UIKit

class MemeEditorViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var MemeEditorView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    let memeEditorTextField = MemeEditorTextField()
    var imagePickerInteractor: ImagePickerInteractor!
    var shareMemeInteractor: ShareMemeInteractor!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        memeEditorTextField.configTextField(topTextField, text: "TOP")
        memeEditorTextField.configTextField(bottomTextField, text: "BOTTOM")
        imagePickerInteractor = ImagePickerInteractor(parentViewController: self)
        shareMemeInteractor = ShareMemeInteractor(parentViewController: self)
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
        
        shareMemeInteractor.shareMeme(meme)
    }
    
    @IBAction func pickAPicture(sender: UIBarButtonItem) {
        imagePickerInteractor.pickAPicture()
    }

    @IBAction func takeAPicture(sender: UIBarButtonItem) {
        imagePickerInteractor.takeAPicture()
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
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.CGRectValue().height
    }
}

