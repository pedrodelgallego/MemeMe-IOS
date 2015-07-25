import UIKit

class SentMemeAsTablePresenter: NSObject, UITableViewDelegate, UITableViewDataSource {
    weak var view: SentMemesViewController!
    let navigator: SentMemesNavigator!
    let interactor = SentMemesInteractor()

    var imageView: UIImageView?
    
    init(view: SentMemesViewController){
        self.view = view
        self.navigator = SentMemesNavigator(view: view)
        // self.view.tableView.registerClass(SentMemeTableViewCell.self, forCellReuseIdentifier: "sentMemeCell")
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.numberOfMemes()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let meme = interactor.getElementAt(indexPath.row)
        let cell = tableView.dequeueReusableCellWithIdentifier("sentMemeCell", forIndexPath: indexPath) as! SentMemeTableViewCell
        cell.setCell(meme.memedImage)
        
        return cell
    }
    
    // Mark: UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let meme = interactor.getElementAt(indexPath.row)
        
        self.imageView = createInitialAnimationState(meme, indexPath: indexPath)
        
        UIView.animateWithDuration(0.5,
            animations: finalAnimationState(imageView!, size: meme.memedImage.size),
            completion: onCompleteAnimation(meme))
    }
    
    
    func createInitialAnimationState(meme: Meme, indexPath: NSIndexPath) -> UIImageView {
        let cell = self.view.tableView.dequeueReusableCellWithIdentifier("sentMemeCell", forIndexPath: indexPath) as! SentMemeTableViewCell;
        let frame = cell.frame
        
        var rect = CGRect(x: frame.origin.x, y: frame.origin.y + 290, width: frame.width, height: 0)
        
        var imageView = UIImageView(frame: rect)
        imageView.alpha = 0.4
        imageView.image = meme.memedImage
        imageView.contentMode = .ScaleAspectFill
        view.view.addSubview(imageView)
        return imageView
    }
    
    func finalAnimationState(view: UIView, size: CGSize) -> (() -> ()) {
        func finalState() {
            view.frame = CGRect(x: 0, y: 64, width: size.width, height: size.height)
            view.alpha = 1
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
