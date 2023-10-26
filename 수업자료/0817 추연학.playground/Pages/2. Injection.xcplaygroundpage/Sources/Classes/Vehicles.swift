import Foundation


public class Car {
    let engine: Engine
    
    public init(engine: Engine) {
        self.engine = engine
    }
    
    public func start() {
        print("Car")
        engine.start()
    }
}

public class Airplane {
    public var engine: Engine?
    
    public init() { }
    
    public func start() {
        print("Airplane")
        engine?.start()
    }
}


public class KTX {
    public init() { }
    public func start(engine: Engine) {
        print("KTX")
        engine.start()
    }
}

public class MyCar {
    private let engine: EngineProtocol
    
    public init(engine: EngineProtocol) {
        self.engine = engine
    }
    
    public func startEngine() {
        engine.start()
    }
    
    public func stopEngine() {
        engine.stop()
    }
}
