import UIKit

class Meme {    
    var topText: String
    var bottomText: String
    var image: UIImage
    var memedImage: UIImage!
    
    init(topText: String, bottomText: String, imageView: UIImageView){
        self.topText = topText
        self.bottomText = bottomText
        self.image = imageView.image!
    }
        
    func generateImage(view: UIView) {
        UIGraphicsBeginImageContext(view.bounds.size)
        view.drawViewHierarchyInRect(view.bounds, afterScreenUpdates: true)
        let memedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.memedImage = memedImage
    }
}