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
    
    func initialAnimationState(view: UIViewController, cell: MemeCollectionViewCell) -> UIImageView {
        let frame = cell.frame
        let rect = CGRect(x: frame.origin.x, y: frame.origin.y + 64, width: frame.width, height: frame.height)
        
        let imageView = UIImageView(frame: rect)
        imageView.image = cell.image
        imageView.contentMode = .ScaleAspectFill
        
        view.view.addSubview(imageView)
        return imageView
    }

    
    func finalAnimationState(view: UIView, size: CGSize) -> (() -> ()) {
        func finalState() {
            view.frame = CGRect(x: 0, y: 64, width: size.width, height: size.height)
        }
        return finalState
    }
    
    func onCompleteAnimation(view: UIView, meme: Meme) -> ((Bool) -> ()){
        func onComplete(_: Bool)  {
            self.navigator.showMeme(meme)
            view.removeFromSuperview()
        }
        
        return onComplete
    }
    
    func startAnimationWithSegue(view: UIView, meme: Meme){
        UIView.animateWithDuration(1,
            animations: finalAnimationState(view, size: meme.memedImage.size),
            completion: onCompleteAnimation(view, meme: meme))
    }
}
