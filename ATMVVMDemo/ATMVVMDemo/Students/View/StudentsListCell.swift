import UIKit
import ATMVVM

class StudentsListCell: ATMVVM_Collection_Cell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func refreshSubviews(_ fromVM: Bool) {
        if let rowVM:StudentsListRowVM = self.itemVM as? StudentsListRowVM {
            let model:StudentsModel? = rowVM.data as? StudentsModel
            
            self.nameLabel.text = model?.name
            self.genderLabel.text = model?.gender.value
            self.introduceLabel.text = model?.introduce
            
            self.introduceHeight.constant = rowVM.introduceHeight
        }
    }
    
    @IBAction func clickChangeGenderButton(_ sender: Any) {
        if let rowVM:StudentsListRowVM = self.itemVM as? StudentsListRowVM, let model:StudentsModel = rowVM.data as? StudentsModel{
            switch model.gender {
            case .male:
                model.gender = .female
            case .female:
                model.gender = .unknown
            default:
                model.gender = .male
            }
            rowVM.createLayout()
            rowVM.refreshViewBlock()
        }
    }
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var introduceLabel: UILabel!
    @IBOutlet weak var introduceHeight: NSLayoutConstraint!
}
