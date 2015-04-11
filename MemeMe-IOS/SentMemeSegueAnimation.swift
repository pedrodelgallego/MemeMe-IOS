//
//  SentMemeSegueAnimation.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 11/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit

class SentMemeSegueAnimation {
    let navigator: SentMemesNavigator!

    init(view: UIViewController){
        self.navigator = SentMemesNavigator(view: view)
    }
    
    
    static  func finalAnimationState(view: UIView, bounds: CGRect) -> (() -> ()) {
        func finalState() {
            view.frame = CGRect(x: 0, y: 64, width: bounds.width, height: bounds.height - 150)
        }
        return finalState
    }
    
    func onCompleteAnimation(meme: Meme) -> ((Bool) -> ()){
        func onComplete(_: Bool)  {
            self.navigator.showMeme(meme)
        //    self.imageView?.removeFromSuperview()
        }
        
        return onComplete
    }
    
}
