//
//  Helpers.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 03/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit

class Helpers {
    let testBundle = NSBundle(forClass: MemeModelTests.self)

    func validImageView() -> UIImageView{
        let image = UIImage(named: "T&Cs.jpg", inBundle: testBundle, compatibleWithTraitCollection: nil)
        
        return UIImageView(image: image)
    }
    
    func aValidMeme() -> Meme {
        return Meme(topText: "hola", bottomText: "adios", imageView: self.validImageView())
    }
}

