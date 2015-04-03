//
//  MemeEditorTextField.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 02/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

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
        NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 38)!,
        NSStrokeWidthAttributeName : 3.0
    ]
    
    func configTextField(textField: UITextField, text: String){
        textField.delegate = self
        textField.backgroundColor = UIColor.clearColor()
        textField.defaultTextAttributes = memeTextAttributes
        textField.textAlignment = .Center
        textField.text = text
    }
}