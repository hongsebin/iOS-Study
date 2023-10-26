import Foundation

public struct Beverage: BeverageProtocol {
    public var beverage = ["americano", "latte", "icetea"]
    public var price = [3000, 3500, 3500]
    
    public func showMenu() {
        for i in 0..<beverage.count {
            let beveragePrint = beverage[i]
            let pricePrint = price[i]
            print("\(beveragePrint) : \(pricePrint)원")
        }
        let order = Order()
        order.separate()
    }
    
}
