import UIKit

class MemeEditorViewController: UIViewController {

    @IBOutlet weak var MemeEditorView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var actionButton: UIBarButtonItem!
    
    
    let memeEditorTextField = MemeEditorTextField()
    var presenter: MemeEditorPresenter!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionButton.enabled = false
        memeEditorTextField.configTextField(topTextField, text: "TOP")
        memeEditorTextField.configTextField(bottomTextField, text: "BOTTOM")
        presenter = MemeEditorPresenter(view: self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        presenter.subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(animated: Bool) {
        presenter.unsubscribeFromKeyboardNotifications()
    }

    // MARK: User actions
    @IBAction func shareMeme(sender: UIBarButtonItem) {
        presenter.shareMeme()
    }
    
    @IBAction func pickAPicture(sender: UIBarButtonItem) {
        presenter.pickAPicture()
    }

    @IBAction func takeAPicture(sender: UIBarButtonItem) {
        presenter.takeAPicture()
    }
}

