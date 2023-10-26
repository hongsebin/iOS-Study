import Foundation

public class Menu: MenuProtocol {
    public var coffee: [String] = ["아메리카노", "카페라떼", "초코라떼"]
    public var price: [Int] = [4000, 4200, 4500, 5000]
    
    public init() {}
    
    public func showMenu() {
        print("    메뉴    |    가격")
        print("----------------------")
        
        for i in 0..<coffee.count {
            let menu = coffee[i]
            let formattedMenu = menu.padding(toLength: 10, withPad: " ", startingAt: 0)
            let formattedPrice = String(price[i])
            
            print("\(formattedMenu) | \(formattedPrice)")
        }
        print("주문하실 음료와 수량을 입력해주세요. ex) 아메리카노 2,카페라떼 1")
        if let input = readLine() {
            let normalizedInput = (input as NSString).precomposedStringWithCompatibilityMapping
            if let (orderMessage, totalPrice) = orderConfirm(input: normalizedInput) {
                print(orderMessage)
                
                if let input2 = readLine() {
                    if input2 == "1" {
                        print("총 \(totalPrice)원 입니다.")
                        done()
                    } else if input2 == "2" {
                        showMenu()
                    }
                }
            }
        }
    }
    
    public func orderConfirm(input: String) -> (String, Int)? {
        let components = input.components(separatedBy: ",")
        var orderMenus: [String] = []
        var orderQuantity: [Int] = []
        var totalPrice: Int = 0
        
        for component in components {
            let trimmedComponent = component.trimmingCharacters(in: .whitespaces)
            let parts = trimmedComponent.components(separatedBy: " ")
            
            if parts.count == 2, let quantity = Int(parts[1]) {
                let menuName = parts[0]
                
                if coffee.firstIndex(of: menuName) != nil {
                    let orderMenu = "\(menuName) \(quantity)잔"
                    orderMenus.append(orderMenu)
                    orderQuantity.append(quantity)
                }
            }
        }
        
        if orderMenus.isEmpty {
            return nil
        }
        
        var orderList: [String] = []
        for i in 0..<orderMenus.count {
            if let menuIndex = coffee.firstIndex(of: orderMenus[i].components(separatedBy: " ")[0]) {
                orderList.append("\(orderMenus[i])")
                totalPrice += price[menuIndex] * orderQuantity[i]
            }
        }
        
        let orderMessage = "\(orderList.joined(separator: ", ")) 맞으십니까? 맞다면 1, 재주문은 2를 입력해주세요."
        return (orderMessage, totalPrice)
    }
    
    public func done() {
        print("잠시만 기다려주세요.")
        sleep(UInt32(5.0))
        print("메뉴 나왔습니다. 안녕히가세요.")
    }
}
