import Foundation

public protocol Coffee: Drinkable {
    var name: String { get }
    var caffeineContent: Double { get }
    var cost: Int { get }
    var personalOptions: [PersonalOption] { get set }
}

public enum PersonalOption {
    case espresso(Int)
    case water(Amount)
    case ice(Amount)
    case whipping(Amount)
    
    var advice: String {
        switch self {
        case .espresso: return "에스프레소를 커스텀으로 즐겨보세요!"
        case .water: return "정량 초과 시 기본 레시피대로 제조됩니다."
        case .ice: return "얼음의 양과 음료의 양은 무관합니다."
        case .whipping: return ""
        }
    }
    
    var state: String {
        switch self {
        case .espresso(let cup): return "에스프레소 \(cup)잔 만큼 넣어주고~"
        case .water(let amount): return "물은 \(amount.korean) 넣었어요."
        case .ice(let amount): return "얼음은 \(amount.korean) 넣었어요."
        case .whipping(let amount): return "휘핑은 \(amount.korean) 넣었어요."
        }
    }
}

public extension PersonalOption {
    enum Amount {
        case none
        case less
        case normal
        case more
        
        var korean: String {
            switch self {
            case .none: return "안"
            case .less: return "조금"
            case .normal: return "보통"
            case .more: return "많이"
            }
        }
    }
}
