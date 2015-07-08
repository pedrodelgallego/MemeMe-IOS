import UIKit

class SentMemeAsCollectionPresenter: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    weak var view: SentMemesCollectionViewController!
    let navigator: SentMemesNavigator!
    let interactor = SentMemesInteractor()
    // let animation: SentMemeSegueAnimation!
    
    init(view: SentMemesCollectionViewController){
        self.view = view
        navigator = SentMemesNavigator(view: view)
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let meme = interactor.getElementAt(indexPath.item)
        let cell = self.view.collectionView.dequeueReusableCellWithReuseIdentifier("sentMemeItem", forIndexPath: indexPath) as! MemeCollectionViewCell
        
        let animation = SentMemeSegueAnimation(view: view);
        let imageView = animation.initialAnimationState(view, cell: cell)
        
        
        animation.startAnimationWithSegue(imageView, meme: meme)
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
}

