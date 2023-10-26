import Foundation

public protocol OrderProtocol {
    // 주문 목록
    var orderBeverage: [String] { get }
    var quantity: [Int] { get }
    
    func hello()
    func bye()
    func separate()
    func orderCheck()
}

public protocol BeverageProtocol {
    // 음료 메뉴 목록
    var beverage: [String] { get }
    
    // 가격 목록
    var price: [Int] { get }
    
    func showMenu()
}
