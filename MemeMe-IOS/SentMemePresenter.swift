import UIKit

class SentMemePresenter: NSObject, UITableViewDelegate, UITableViewDataSource,UICollectionViewDelegate, UICollectionViewDataSource {
    weak var view: UIViewController!
    let navigator: SentMemesNavigator!
    let memeDataStorage = MemeDataStorage()

    init(view: UIViewController){
        self.view = view
        self.navigator = SentMemesNavigator(view: view)
    }
    
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memeDataStorage.all().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = memeDataStorage.getElementAt(indexPath.row).topText
        return cell
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
