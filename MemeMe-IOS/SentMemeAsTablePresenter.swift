import UIKit

class SentMemeAsTablePresenter: NSObject, UITableViewDelegate, UITableViewDataSource {
    weak var view: SentMemesViewController!
    let navigator: SentMemesNavigator!
    let interactor = SentMemesInteractor()

    init(view: SentMemesViewController){
        self.view = view
        self.navigator = SentMemesNavigator(view: view)
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.numberOfMemes()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let meme = interactor.getElementAt(indexPath.row)
        
        let cell = UITableViewCell()
        cell.textLabel?.text = meme.topText
        return cell
    }
    
    // Mark: UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let meme = interactor.getElementAt(indexPath.row)
        
        navigator.showMeme(meme)
    }
}
