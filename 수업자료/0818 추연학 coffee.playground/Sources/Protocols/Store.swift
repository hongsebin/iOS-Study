import Foundation

public protocol Store {
    associatedtype Menu
    associatedtype Staff
    associatedtype Option
    associatedtype OrderSheet
    
    var name: String { get }
    var menu: [Menu] { get set }
    var staff: [Staff] { get set }
    var isClosed: Bool { get set }
    
    func open()
    func close()
    func order(orderSheet: OrderSheet) -> Menu?
    func bringMenu() -> [Menu]
}
