//
//  SelectImageForMeme.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 05/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit
import XCTest

class SelectImageForMeme: XCTestCase {
    var presenter: MemeEditorPresenter!
    
    override func setUp() {
        let view = MemeEditorViewController();
        presenter = MemeEditorPresenter(view: view)
        presenter.navigator = MemeEditorNavigatorMock(view: view)
        presenter.interactor = MemeEditorInteractorMock()
    }
    
    func testSelectAnImageFromThePhotoLibrary(){
        presenter.pickAPicture()
        XCTAssertEqual((presenter.navigator as! MemeEditorNavigatorMock).imagePickerWasCalledWithSourceType, UIImagePickerControllerSourceType.PhotoLibrary, "it should use the photo library")
    }
    
//    func testTakeAPicture(){
//        presenter.takeAPicture()
//        XCTAssertEqual((presenter.navigator as! MemeEditorNavigatorMock).imagePickerWasCalledWithSourceType, UIImagePickerControllerSourceType.Camera, "it should use the camera")
//    }
}
