import UIKit

class SentMemeAsCollectionPresenter: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    weak var view: UIViewController!
    let navigator: SentMemesNavigator!
    let memeDataStorage = MemeDataStorage()
    
    init(view: UIViewController){
        self.view = view
        self.navigator = SentMemesNavigator(view: view)
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        let meme = memeDataStorage.getElementAt(indexPath.item)
        navigator.showMeme(meme)
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memeDataStorage.all().count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("sentMemeItem", forIndexPath: indexPath) as! MemeCollectionViewCell
        
        let meme = memeDataStorage.getElementAt(indexPath.item)
        cell.configCellUIElements(meme)
        
        return cell
    }
}

