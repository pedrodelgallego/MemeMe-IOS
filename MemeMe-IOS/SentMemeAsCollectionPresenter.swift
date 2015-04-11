import UIKit

class SentMemeAsCollectionPresenter: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    weak var view: SentMemesCollectionViewController!
    let navigator: SentMemesNavigator!
    let interactor = SentMemesInteractor()
    
    var imageView: UIImageView?
    
    init(view: SentMemesCollectionViewController){
        self.view = view
        self.navigator = SentMemesNavigator(view: view)
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let meme = interactor.getElementAt(indexPath.item)
        self.imageView = createInitialAnimationState(meme, indexPath: indexPath)
        
        UIView.animateWithDuration(0.5,
            animations: finalAnimationState(imageView!, size: meme.memedImage.size),
            completion: onCompleteAnimation(meme))
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interactor.numberOfMemes()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("sentMemeItem", forIndexPath: indexPath) as! MemeCollectionViewCell
        
        let meme = interactor.getElementAt(indexPath.item)
        cell.configCellUIElements(meme)
        
        return cell
    }
    
    func createInitialAnimationState(meme: Meme, indexPath: NSIndexPath) -> UIImageView {
        let frame = view.collectionView.layoutAttributesForItemAtIndexPath(indexPath)?.frame
        var rect = CGRect(x: frame!.origin.x, y: frame!.origin.y + 64, width: frame!.width, height: frame!.height)
        
        var imageView = UIImageView(frame: rect)
        imageView.image = meme.memedImage
        imageView.contentMode = .ScaleAspectFill
        view.view.addSubview(imageView)
        return imageView
    }
    
    func finalAnimationState(view: UIView, size: CGSize) -> (() -> ()) {
        func finalState() {
            view.frame = CGRect(x: 0, y: 64, width: size.width, height: size.height)
        }
        return finalState
    }
    

    func onCompleteAnimation(meme: Meme) -> ((Bool) -> ()){
        func onComplete(_: Bool)  {
            self.navigator.showMeme(meme)
            self.imageView?.removeFromSuperview()
        }
        
        return onComplete
    }
}

