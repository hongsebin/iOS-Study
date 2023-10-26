import Foundation

public class Greeting: GreetingProtocol {
    public let menu: MenuProtocol = Menu()
    
    public init() {}
    
    public func hello() {
        print("어서오세요. 음료를 주문하시려면 1, 취소는 0을 입력해주세요.")
        if let input = readLine() {
            if input == "1" {
                menu.showMenu()
            } else if input == "0" {
                bye()
            }
        }
    }
    
    public func bye() {
        print("안녕히가세요.")
    }
}
