import Foundation

public final class 별다방: Store {
    public typealias Menu = Coffee
    public typealias Staff = Barista
    public typealias Option = PersonalOption
    public typealias OrderSheet = StarbucksOrderSheet
    
    public var menu: [Menu] = []
    public var staff: [Barista] = []
    public var isClosed: Bool = true
    public var name = "별다방"
    
    public init() {
        getMenuList()
        getBaristaList()
    }
    
    private func getMenuList() {
        let espresso = Espresso()
        let latte = Latte()
        let coldBrew = ColdBrew()
        
        menu = [espresso, latte, coldBrew]
    }
    
    private func getBaristaList() {
        let eunjin = Barista(name: "eunjin")
        let jinwoo = Barista(name: "jinwoo")
        let yeonhak = Barista(name: "yeonhak")
        
        staff = [eunjin, jinwoo, yeonhak]
    }
    
    public func open() {
        print("\(name) : \(#function)")
        isClosed = false
    }
    
    public func close() {
        print("\(name) : \(#function)")
        isClosed = true
    }
    
    public func order(orderSheet: OrderSheet) -> Menu? {
        guard !isClosed else {
            print("아직 문을 안 열었습니다! 문이 열리면 이용해주세요!")
            return nil
        }
        
        let barista = getBarista()
        let coffee = barista?.makeCoffee(orderSheet: orderSheet)
        
        return coffee
    }
    
    public func bringMenu() -> [Menu] {
        menu
    }
    
    private func getBarista() -> Barista? {
        staff.first { $0.state == .ready }
    }
}

public extension 별다방 {
    struct StarbucksOrderSheet {
        let customer: Customer
        let coffee: Coffee
        let isHot: Bool
        let coffeeSize: CoffeeSize
        let cupType: CupType
        let personalOption: [PersonalOption]
        
        public init(customer: Customer,
                    coffee: Coffee,
                    isHot: Bool,
                    coffeeSize: CoffeeSize,
                    cupType: CupType,
                    personalOption: [PersonalOption]) {
            self.customer = customer
            self.coffee = coffee
            self.isHot = isHot
            self.coffeeSize = coffeeSize
            self.cupType = cupType
            self.personalOption = personalOption
        }
    }
}
