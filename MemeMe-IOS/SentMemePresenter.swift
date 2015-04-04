import UIKit

class SentMemePresenter: NSObject, UITableViewDelegate, UICollectionViewDelegate {
    weak var view: UIViewController!
    let navigator: SentMemesNavigator!
    let memeDataStorage = MemeDataStorage()

    init(view: UIViewController){
        self.view = view
        self.navigator = SentMemesNavigator(view: view)
    }
    
    // Mark: UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let meme = memeDataStorage.getElementAt(indexPath.row)
        navigator.showMeme(meme)
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        let meme = memeDataStorage.getElementAt(indexPath.item)
        navigator.showMeme(meme)
    }
}
