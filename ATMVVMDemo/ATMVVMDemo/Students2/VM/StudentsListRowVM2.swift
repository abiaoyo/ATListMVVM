import UIKit
import ATMVVM

class StudentsListRowVM2: ATMVVM_Table_RowVM {

    var introduceHeight:CGFloat = 20.0
    
    override func createLayout() {
        let model:StudentsModel = self.data as! StudentsModel
        let introduce:NSString = (model.introduce ?? "") as NSString
        let size = introduce.boundingRect(with: CGSize.init(width: UIScreen.main.bounds.width-20, height: 1000), options: [.usesFontLeading,.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17)], context: nil)
        introduceHeight = size.height
        
        cellId = "StudentsListCell2"
        
        self.rowHeight = 10 + 20 + 10 + 20 + 10 + introduceHeight + 10
    }
    
}
