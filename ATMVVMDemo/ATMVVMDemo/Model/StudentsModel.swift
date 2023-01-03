import UIKit

enum Gender: CaseIterable{
    case unknown
    case male
    case female
    
    var value:String {
        switch self {
        case .male:
            return "男"
        case .female:
            return "女"
        default:
            return "未知"
        }
    }
}

class StudentsModel: NSObject {
    var name:String?
    var gender:Gender = .unknown
    var introduce:String?
}
