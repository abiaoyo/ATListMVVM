import UIKit
import ATMVVM

class StudentsListViewController2: UIViewController {

    lazy var tableView: UITableView = {
        let v = UITableView.init(frame: CGRect.zero, style: UITableView.Style.plain)
        return v
    }()
    
    lazy var listVM = StudentsListVM2.init(viewProxy: ATMVVM_Table_Proxy.init())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupSubviews()
        
        listVM.reloadData()
    }
    
    func setupData() {
        listVM.navCtl = self.navigationController
        listVM.delegate = self
        listVM.viewProxy.forwarder = self
        listVM.createData()
    }
    
    func setupSubviews() {
        tableView.frame = self.view.bounds
        tableView.register(UINib.init(nibName: "StudentsListCell2", bundle: Bundle.init(for: StudentsListCell2.self)), forCellReuseIdentifier: "StudentsListCell2")
        tableView.setup(withViewProxy: listVM.viewProxy)
        tableView.backgroundColor = UIColor.orange
        self.view.addSubview(tableView)
    }
    
}

extension StudentsListViewController2:ATMVVM_ListState_Delegate {
    func didChange(_ state: ATMVVMState, flag: Int, msg: String?, err: Error?) {
        tableView.reloadData()
    }
}

extension StudentsListViewController2: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("tableView willDisplay cell: .section:\(indexPath.section) \t .row:\(indexPath.row)")
    }
    
}
