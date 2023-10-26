import Foundation

class Order: OrderProtocol {
    public var orderBeverage: [String] = []
    public var quantity: [Int] = []
    
    func bye() {
        print("안녕히가세요.")
    }
    
    func hello() {
        print("어서오세요. 주문을 시작하시려면 1, 취소는 0을 입력해주세요.")
        if let input = readLine() {
        // 입력된 값이 있을 경우 input 변수에 할당.
            if input == "1" {
                let beverage = Beverage()
                beverage.showMenu()
            } else if input == "0" {
                bye()
            }
        }
    }
    
    func separate() {
        print("주문하실 음료의 이름과 수량을 순서대로 입력해주세요. 예) 아메리카노2, 카페라떼 1")
        if let input = readLine() {
            // 1. 쉼표를 기준으로 분리.
            let separate = input.components(separatedBy: ",")
            
            for s in separate {
                // 2. 양쪽 공백 제거
                let trimmed = s.trimmingCharacters(in: .whitespaces)
                
                // 3. 음료 수량만 quantity 배열에 저장
                let numbers = trimmed.filter { $0.isNumber }
                quantity.append(Int(numbers)!)
                
                // 4. 음료는 beverage 배열에 저장
                let beverageName = trimmed.filter { !$0.isNumber }.trimmingCharacters(in: .whitespaces)
                orderBeverage.append(beverageName)
            }
            orderCheck()
        }
    }
    
    func orderCheck() {
        var checkMessage = "주문하신 음료는 "
        
        for i in 0..<orderBeverage.count {
            checkMessage += "\(orderBeverage[i]) \(quantity[i])잔"
            if i < orderBeverage.count - 1 {
                checkMessage += ", "
            }
        }
        print(checkMessage + " 맞으십니까?")
        print("맞으면 1, 재주문은 2를 입력해주세요.")
        orderPrice()
    }
    
    func orderPrice() {
        if let input = readLine() {
            if input == "2" {
                let beverage = Beverage()
                beverage.showMenu()
            } else if input == "1" {
                var totalPrice = 0
                
                // Beverage 인스턴스 생성
                let beverageInstance = Beverage()
                
                for i in 0..<orderBeverage.count {
                    if let beverageIndex = beverageInstance.beverage.firstIndex(of: orderBeverage[i]) {
                        let price = beverageInstance.price[beverageIndex]
                        let quantity = self.quantity[i]
                        let subtotal = price * quantity
                        totalPrice += subtotal
                    }
                }
                print("총 \(totalPrice)원 입니다.")

            }
        }
    }

    
}
