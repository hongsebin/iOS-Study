import Foundation

public protocol MenuProtocol {
    var coffee: [String] { get }
    var price: [Int] { get }
    func showMenu()
    func orderConfirm(input: String) -> (String, Int)?
    func done()
}

public protocol GreetingProtocol {
    func hello()
    func bye()
}
