import Foundation
import UIKit

class MemeEditorTextField: NSObject, UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    let memeTextAttributes = [
        NSStrokeColorAttributeName : UIColor.blackColor(),
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        // default fontsize 40; with shrink to fit to minimum 26
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName : -3.0
    ]
    
    func configTextField(textField: UITextField, text: String){
        textField.delegate = self
        textField.backgroundColor = UIColor.clearColor()
        textField.defaultTextAttributes = memeTextAttributes
        textField.textAlignment = .Center
        textField.text = text
    }
}