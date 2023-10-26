import Foundation

public final class Customer: Person {
    public var name: String
    public var money: Int
    public var state: State?
    
    public init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    public func bringMenu<T: Store>(store: T) -> [T.Menu] {
        print(name + ": 메뉴판 주세요.")
        return store.bringMenu()
    }
    
    public func drink(drink: Drinkable?) {
        guard let drink else { return }
        drink.drink()
    }
}


public extension Customer {
    enum State { }
}
