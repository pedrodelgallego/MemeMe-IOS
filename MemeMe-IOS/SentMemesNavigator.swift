import UIKit

class SentMemesNavigator {
    weak var view: UIViewController!
    
    init(view: UIViewController){
        self.view = view
    }
    
    func showMeme(meme: Meme){
        var vc: MemeViewController = view.storyboard?.instantiateViewControllerWithIdentifier("MemeVC") as! MemeViewController
        
        vc.meme = meme
        self.view.navigationController?.pushViewController(vc, animated: true)
    }
}
