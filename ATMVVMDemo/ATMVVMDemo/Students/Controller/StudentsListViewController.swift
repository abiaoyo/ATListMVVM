import UIKit
import ATMVVM

class StudentsListViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        let v = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        return v
    }()
    
    lazy var listVM = StudentsListVM.init(viewProxy: ATMVVM_Collection_Proxy.init())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupSubviews()
        
        listVM?.reloadData()
    }
    
    func setupData() {
        listVM?.navCtl = self.navigationController
        listVM?.delegate = self
        listVM?.viewProxy.forwarder = self
        listVM?.createData()
    }
    
    func setupSubviews() {
        collectionView.frame = self.view.bounds
        collectionView.register(UINib.init(nibName: "StudentsListCell", bundle: Bundle.init(for: StudentsListCell.self)), forCellWithReuseIdentifier: "StudentsListCell")
        collectionView.setup(withViewProxy: listVM?.viewProxy)
        collectionView.backgroundColor = UIColor.cyan
        self.view.addSubview(collectionView)
    }
}

extension StudentsListViewController:ATMVVM_ListState_Delegate {
    func didChange(_ state: ATMVVMState, flag: Int, msg: String?, err: Error?) {
        collectionView.reloadData()
    }
}

extension StudentsListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("collectionView willDisplay cell: .section:\(indexPath.section) \t .row:\(indexPath.row)")
    }
    
}

