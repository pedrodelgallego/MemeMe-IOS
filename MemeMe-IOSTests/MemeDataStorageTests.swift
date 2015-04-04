//
//  MemeDataStorageTests.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 04/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import XCTest

class MemeDataStorageTests: XCTestCase {
    let memeDataStorage = MemeDataStorage()
    let helper = Helpers()
    var meme: Meme!
    
    override func setUp() {
        meme = Meme(topText: "hola", bottomText: "adios", imageView: helper.validImageView())
    }
    
    func testMemeCollectionIsEmpty(){
        XCTAssertEqual(memeDataStorage.all().count, 0, "it should store the meme in the collection")
    }
    
    func testSaveAMeme(){
        memeDataStorage.saveMeme(meme)
        XCTAssertEqual(memeDataStorage.all().count, 1, "it should store the meme in the collection")
    }
}
