//
//  SentMemeTableViewCell.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 19/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit

class SentMemeTableViewCell: UITableViewCell {
    func setCell(image: UIImage){
        backgroundView = UIImageView(image: image)
    }

}
