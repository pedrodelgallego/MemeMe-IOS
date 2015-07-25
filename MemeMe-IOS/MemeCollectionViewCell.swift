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
