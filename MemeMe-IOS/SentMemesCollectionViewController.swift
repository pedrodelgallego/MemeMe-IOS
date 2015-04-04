//
//  SentMemesCollectionViewController.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 03/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit

class SentMemesCollectionViewController: UIViewController {
    let dataSource = MemeDataSource()
    var interactor: SentMemePresenter!

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        collectionView.dataSource = dataSource
        
        interactor = SentMemePresenter(view: self)
        collectionView.delegate = interactor
    }
}
