import Foundation

public class Barista: Person {
    public var name: String
    public var state: State? = .ready
    
    public init(name: String) {
        self.name = name
    }
    
    public func makeCoffee(orderSheet: 별다방.OrderSheet) -> Coffee {
        print("바리스타: 커피만들러 가자")
        var coffee = orderSheet.coffee
        
        coffee.isHot = orderSheet.isHot
        
        checkOption(coffee: &coffee, personalOptions: orderSheet.personalOption)
        
        print(name + ": \(orderSheet.customer.name)님 주문하신 \(coffee.name) 나왔습니다.")
        
        return coffee
    }
    
    private func checkOption(coffee: inout Coffee, personalOptions: [PersonalOption]) {
        for option in personalOptions {
            print(name + ": " + option.state)
        }
        
        coffee.personalOptions = personalOptions
    }
}


public extension Barista {
    enum State {
        case ready
        case making
    }
}
