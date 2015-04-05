import UIKit

class MemeEditorKeywordManager: NSObject {
    var view: MemeEditorViewController!
    
    init(view: MemeEditorViewController){
        self.view = view
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
        if view.shouldKeyboardMove {
            let offset = getKeyboardHeight(notification)
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                view?.view.frame.origin.y += offset
            })
        }
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if view.shouldKeyboardMove {
            let offset = getKeyboardHeight(notification)
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                view?.view.frame.origin.y -= offset
            })
        }
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        
        return keyboardSize.CGRectValue().height
    }
}