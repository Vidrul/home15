
import Foundation


enum SizeOfThePizza: String {
    case small = "15см"
    case medium = "20см"
    case big = "25см"
    func description() -> String {
        switch self {
        case .small:
            return "Small"
        case .medium:
            return "Medium"
        case .big:
            return "Big"
        }
    }
}

struct Pizza {
    var name: String
    var size: SizeOfThePizza
    var isThick: Bool
}
