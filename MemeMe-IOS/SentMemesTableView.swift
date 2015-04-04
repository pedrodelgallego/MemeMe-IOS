import UIKit

class sentMemesViewController: UIViewController {
    var presenter: SentMemeAsTablePresenter!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        presenter = SentMemeAsTablePresenter(view: self)
        tableView.dataSource = presenter
        tableView.delegate = presenter
    }
}
