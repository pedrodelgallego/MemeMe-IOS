import UIKit

class sentMemesViewController: UIViewController {
    let dataSource = MemeDataSource()
    var presenter: SentMemePresenter!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.dataSource = dataSource
        
        presenter = SentMemePresenter(view: self)
        tableView.delegate = presenter
    }
}
