//
//  SentMemesCollectionViewController.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 03/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit

class SentMemesCollectionViewController: UIViewController {
    var presenter: SentMemeAsCollectionPresenter!

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        presenter = SentMemeAsCollectionPresenter(view: self)
        collectionView.delegate = presenter
        collectionView.dataSource = presenter
    }
}
