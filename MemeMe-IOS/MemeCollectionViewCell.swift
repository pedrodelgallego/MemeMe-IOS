import UIKit

class MemeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var topTextLabel: UILabel!
    @IBOutlet weak var bottomTextLabel: UILabel!
    var image: UIImage!
    
    func configCellUIElements(meme: Meme){
        let imageView = UIImageView(image: meme.image)
        backgroundView = imageView
        image = imageView.image
        topTextLabel.text = meme.topText
        bottomTextLabel.text = meme.bottomText
    }
}
