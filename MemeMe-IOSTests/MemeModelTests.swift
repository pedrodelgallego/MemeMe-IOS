//
//  MemeModelTests.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 03/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit
import XCTest

class MemeModelTests: XCTestCase {
    let helper = Helpers()
    var meme: Meme!
    
    override func setUp() {
        meme = Meme(topText: "hola", bottomText: "adios", imageView: helper.validImageView())
    }
    
    func testCreateAMeme() {
        XCTAssertEqual(meme.topText, "hola", "it should initalize the topText property")
        
        XCTAssertEqual(meme.bottomText, "adios", "it should initalize the bottomText property")
    }
    
    func testMemeCollectionIsEmpty(){
        XCTAssertEqual(Meme.collection.count, 0, "it should store the meme in the collection")
    }
    
    func testSaveAMeme(){
        meme.save()
        XCTAssertEqual(Meme.collection.count, 1, "it should store the meme in the collection")
    }
    
    func testGenerateImage(){
        XCTAssertNil(meme.memedImage, "it should be empty")
        meme.generateImage(helper.validImageView())
        XCTAssertNotNil(meme.memedImage, "it should have a meme image")
    }
}
