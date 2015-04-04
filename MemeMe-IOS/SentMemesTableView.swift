//
//  SentMemesTableView.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 03/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit

class sentMemesViewController: UIViewController {
    let dataSource = MemeDataSource()
    var interactor: SentMemePresenter!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.dataSource = dataSource
        
        interactor = SentMemePresenter(view: self)
        tableView.delegate = interactor
    }
}
