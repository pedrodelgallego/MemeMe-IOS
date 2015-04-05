import Foundation
import UIKit

class MemeEditorTextField: UITextField, UITextFieldDelegate {
    var view: MemeEditorViewController!
    var shouldKeyboardMove = false
    
    let memeTextAttributes = [
        NSStrokeColorAttributeName: UIColor.blackColor(),
        NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 32)!,
        NSStrokeWidthAttributeName : -3.0
    ]
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clearColor()
        self.defaultTextAttributes = memeTextAttributes
        self.clearsOnBeginEditing = true
        self.delegate = self
        self.textAlignment = .Center
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        view.shouldKeyboardMove = self.shouldKeyboardMove
    }

    func configTextField(text: String, view: MemeEditorViewController, shouldKeyboardMove: Bool = true){
        self.view = view
        self.shouldKeyboardMove = shouldKeyboardMove
        self.text = text
    }
}