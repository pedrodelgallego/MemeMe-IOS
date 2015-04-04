import UIKit

class sentMemesViewController: UIViewController {
    let dataSource = MemeDataSource()
    var presenter: SentMemePresenter!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        presenter = SentMemePresenter(view: self)
        tableView.dataSource = presenter
        tableView.delegate = presenter
    }
}
