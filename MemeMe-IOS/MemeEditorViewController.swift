import UIKit

class MemeEditorViewController: UIViewController {

    @IBOutlet weak var MemeEditorView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var actionButton: UIBarButtonItem!
    
    @IBOutlet weak var topTextField: MemeEditorTextField!
    @IBOutlet weak var bottomTextField: MemeEditorTextField!
    
    // let memeEditorTextField = MemeEditorTextField()
    var presenter: MemeEditorPresenter!
    var shouldKeyboardMove = false
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        actionButton.enabled = false
        topTextField.configTextField("TOP", view: self, shouldKeyboardMove: false)
        bottomTextField.configTextField("BOTTOM", view: self)
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
    
    // Mark: Abstract the view structure
    
    func slideDown(offset: CGFloat) {
        UIView.animateWithDuration(0.1) { self.view.frame.origin.y += offset }
    }
    
    func slideUp(offset: CGFloat){
        UIView.animateWithDuration(0.1) { self.view.frame.origin.y -= offset }
    }
}

