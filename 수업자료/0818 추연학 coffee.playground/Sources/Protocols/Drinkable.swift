import Foundation

public protocol Drinkable {
    var isHot: Bool { get set }
    
    func drink()
}
