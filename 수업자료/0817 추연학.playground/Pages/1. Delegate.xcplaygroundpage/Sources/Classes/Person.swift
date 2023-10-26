import Foundation

public class Person {
    private let name: String
    
    private var money = 0
    
    public init(name: String) {
        self.name = name
    }
}

extension Person: ButtonDelegate {
    public func didTapButton() {
//        print("\(name)(이)가 button을 눌렀습니다.")
        money += 100
        print(money)
    }
}

extension Person: PhoneDelegate {
    public func didRing(message: String) {
        print(message)
    }
}

extension Person: CalDelegate {
    public func didNotice(with: Present) {
        print(with)
    }
}

extension Person: CustomStringConvertible {
    public var description: String {
        "사람: \(name)"
    }
}

