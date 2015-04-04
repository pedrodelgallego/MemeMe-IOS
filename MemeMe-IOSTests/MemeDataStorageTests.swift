//
//  MemeDataStorageTests.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 04/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import XCTest

class MemeDataStorageTests: XCTestCase {
    let memeDS = MemeDataStorage()
    let helper = Helpers()
    var meme: Meme!
    
    override func setUp() {
        meme = Meme(topText: "0", bottomText: "0", imageView: helper.validImageView())
    }
    
    func testMemeCollectionIsEmpty(){
        XCTAssertEqual(memeDS.all().count, 0, "it should store the meme in the collection")
    }
    
    func testSaveAMeme(){
        memeDS.saveMeme(meme)
        XCTAssertEqual(memeDS.all().count, 1, "it should store the meme in the collection")
    }
    
    func testGetElementAt(){
        let anotherMeme = Meme(topText: "1", bottomText: "1", imageView: helper.validImageView())
        
        memeDS.saveMeme(meme)
        memeDS.saveMeme(anotherMeme)

        var returnedMeme = memeDS.getElementAt(1)
        XCTAssertEqual(returnedMeme.bottomText, anotherMeme.bottomText, "It should be the second meme")
    }
    
    func testRemoveAll(){
        memeDS.saveMeme(meme)
        memeDS.saveMeme(Meme(topText: "1", bottomText: "1", imageView: helper.validImageView()))
        XCTAssertEqual(memeDS.all().count, 2, "it should store the meme in the collection")
        
        memeDS.removeAll()
        XCTAssertEqual(memeDS.all().count, 0, "it should store the meme in the collection")
    }
    

    override func tearDown() {
        memeDS.removeAll()
    }
}
