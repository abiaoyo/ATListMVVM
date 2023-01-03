import UIKit

class StudentsEditViewController2: UIViewController {

    var rowVM:StudentsListRowVM2?
    
    typealias Completion = () -> Void
    var completion:Completion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.maleButton.setTitleColor(UIColor.gray, for: .normal)
        self.maleButton.setTitleColor(UIColor.red, for: .selected)
        
        self.femaleButton.setTitleColor(UIColor.gray, for: .normal)
        self.femaleButton.setTitleColor(UIColor.red, for: .selected)
        
        if let model:StudentsModel = rowVM?.data as? StudentsModel {
            self.nameTF.text = model.name
            self.maleButton.isSelected = model.gender == .male
            self.femaleButton.isSelected = model.gender == .female
            self.introduceTV.text = model.introduce
        }
    }
    @IBAction func clickSubmitButton(_ sender: Any) {
        let model:StudentsModel? = rowVM?.data as? StudentsModel
        model?.name = self.nameTF.text
        model?.gender = self.maleButton.isSelected ? .male : .female
        model?.introduce = self.introduceTV.text
        rowVM?.refreshViewBlock()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickSubmitButton2(_ sender: Any) {
        let model:StudentsModel? = rowVM?.data as? StudentsModel
        model?.name = self.nameTF.text
        model?.gender = self.maleButton.isSelected ? .male : .female
        model?.introduce = self.introduceTV.text
        self.completion?()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickMaleButton(_ sender: Any) {
        self.maleButton.isSelected = true
        self.femaleButton.isSelected = false
    }
    @IBAction func clickFemaleButton(_ sender: Any) {
        self.maleButton.isSelected = false
        self.femaleButton.isSelected = true
    }
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var maleButton: UIButton!
    
    @IBOutlet weak var femaleButton: UIButton!
    
    @IBOutlet weak var introduceTV: UITextView!
    
}
