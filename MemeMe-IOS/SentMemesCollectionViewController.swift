import UIKit

class SentMemesCollectionViewController: UIViewController {
    var presenter: SentMemeAsCollectionPresenter!

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        presenter = SentMemeAsCollectionPresenter(view: self)
        collectionView.delegate = presenter
        collectionView.dataSource = presenter
    }
    
    override func viewDidDisappear(animated: Bool) {
        // presenter.imageView.removeFromSuperview()
    }
}
