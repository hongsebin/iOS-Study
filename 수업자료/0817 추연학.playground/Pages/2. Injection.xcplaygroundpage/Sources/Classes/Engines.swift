import Foundation

public class Engine {
    public init() { }
    func start() {
        print("부릉부릉")
        print()
    }
}

public protocol EngineProtocol {
    func start()
    func stop()
}

public class GasolineEngine: EngineProtocol {
    public init() { }
    
    public func start() {
        print("가솔린 차 부릉부릉")
    }
    
    public func stop() {
        print("가솔린차 멈춤")
    }
}

public class ElectricEngine: EngineProtocol {
    public init() { }
    
    public func start() {
        print("전기차 부릉부릉")
    }
    public func stop() {
        print("전기차 멈춤")
    }
}
