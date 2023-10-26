import Foundation

public enum CoffeeSize {
    case tall
    case grande
    case venti
    
    var capacity: Int {
        switch self {
        case .tall: return 355
        case .grande: return 473
        case .venti: return 591
        }
    }
}

public enum CupType {
    case store
    case personal
    case disposable
    
    var korean: String {
        switch self {
        case .store: return "매장컵"
        case .personal: return "개인컵"
        case .disposable: return "일회용컵"
        }
    }
}
