//
//  MemeCollectionViewCell.swift
//  MemeMe-IOS
//
//  Created by Pedro Del Gallego on 03/04/15.
//  Copyright (c) 2015 Pedro Del Gallego. All rights reserved.
//

import UIKit

class MemeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var topTextLabel: UILabel!
    
    @IBOutlet weak var bottomTextLabel: UILabel!
    
    func configCellUIElements(meme: Meme){
        let imageView = UIImageView(image: meme.image)
        self.backgroundView = imageView
        self.topTextLabel.text = meme.topText
        self.bottomTextLabel.text = meme.bottomText
    }
}
