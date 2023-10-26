import Foundation

// Flyable이라는 프로토콜을 정의합니다. 이 프로토콜은 어떤 것이 '날 수 있음'을 나타내는 기능을 정의합니다.
public protocol Flyable {
    var maximumAltitude: Double { get }
    func ascend(to altitude: Double) // 오르다
}

// Bird라는 구조체는 Flyable 프로토콜을 준수합니다. 즉, Bird는 '날 수 있음'을 나타냅니다.
public struct Bird: Flyable {
    public var maximumAltitude: Double = 10000
    
    public init() { }

    public func ascend(to altitude: Double) {
        if altitude <= maximumAltitude {
            print("The bird ascends to \(altitude) feet.")
        } else {
            print("The bird cannot ascend to \(altitude) feet. It can only ascend up to \(maximumAltitude) feet.")
        }
    }
}

// Plane라는 구조체도 Flyable 프로토콜을 준수합니다. 따라서 Plane 또한 '날 수 있음'을 나타냅니다.
public struct Plane: Flyable {
    public var maximumAltitude: Double = 30000
    
    public init() { }

    public func ascend(to altitude: Double) {
        if altitude <= maximumAltitude {
            print("The plane ascends to \(altitude) feet.")
        } else {
            print("The plane cannot ascend to \(altitude) feet. It can only ascend up to \(maximumAltitude) feet.")
        }
    }
}
