//
//  ShareMemeTests.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 05/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit
import XCTest

class ShareMemeTests: XCTestCase {
    var presenter: MemeEditorPresenter!

    override func setUp() {
        let view = MemeEditorViewController();
        presenter = MemeEditorPresenter(view: view)
        presenter.navigator = MemeEditorNavigatorMock(view: view)
        presenter.interactor = MemeEditorInteractorMock()
    }
    
    func testShareMemeAction(){
        presenter.shareMeme()
        XCTAssertTrue((presenter.navigator as! MemeEditorNavigatorMock).presentActivityWasCalled, "it should present the activity view")
        
        XCTAssertTrue((presenter.interactor as! MemeEditorInteractorMock).saveMemeWasCalled, "it should save the meme")
    }
}
