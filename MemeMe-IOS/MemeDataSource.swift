import UIKit

class MemeDataSource: NSObject, UITableViewDataSource, UICollectionViewDataSource {
    let memeDataStorage = MemeDataStorage()
    // Mark: Reusable methods
    
    func numberOfItemsInCollection() -> Int{
        return memeDataStorage.all().count
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfItemsInCollection()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = memeDataStorage.getElementAt(indexPath.row).topText
        return cell
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInCollection()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("sentMemeItem", forIndexPath: indexPath) as! MemeCollectionViewCell
        
        let meme = memeDataStorage.getElementAt(indexPath.item)
        cell.configCellUIElements(meme)
        
        return cell
    }
}