//
//  Fixture.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 05/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import Foundation

class Fixture {
    static func validMeme(topText:String = "hola", bottomText:String = "adios") -> Meme{
        return Meme(topText: topText, bottomText: bottomText, imageView: Helpers().validImageView())
    }
}
