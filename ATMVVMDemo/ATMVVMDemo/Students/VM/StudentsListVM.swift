import UIKit
import ATMVVM

class StudentsListVM: ATMVVM_Collection_ListVM {

    var datas:[StudentsModel] = []
    
    var navCtl:UINavigationController?
    
    override func createData() {
        let model1 = StudentsModel.init()
        model1.name = "张三"
        model1.gender = .female
        model1.introduce = "SDFSFSFD"
        datas.append(model1)
        
        let model2 = StudentsModel.init()
        model2.name = "李四"
        model2.gender = .male
        model2.introduce = "WEOFJSFOSJFLSDFLKS SOFjlsfjois  WSEFOJSFSLDFKO WEOJSLFS DOJWEFLSDFJIUWHEFISFHS DsSDFSDF"
        datas.append(model2)
    }
    
    override func reloadData() {
        viewProxy.defaultSectionVM.itemVMs.removeAllObjects()
        for data in datas {
            let rowVM = StudentsListRowVM.init()
            rowVM.data = data
            rowVM.createLayout()
            rowVM.didSelectItemBlock = { [weak self] collectionView, indexPath, itemVM in
                let vctl = StudentsEditViewController.init()
                vctl.rowVM = itemVM as? StudentsListRowVM
                vctl.completion = {
                    itemVM.createLayout()
                    self?.didChange(.reload, flag: 0, msg: nil, err: nil)
                }
                self?.navCtl?.pushViewController(vctl, animated: true)
            }
            viewProxy.defaultSectionVM.itemVMs.add(rowVM)
        }
        didChange(.reload, flag: 0, msg: nil, err: nil)
    }
    
}
