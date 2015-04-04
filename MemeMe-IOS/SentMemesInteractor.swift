//
//  SentMemesInteractor.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 04/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

class SentMemesInteractor {
    let memeDS = MemeDataStorage()
    
    func getElementAt(index: Int) -> Meme {
        return memeDS.getElementAt(index)
    }
    
    func numberOfMemes() -> Int {
        return memeDS.all().count
    }
}