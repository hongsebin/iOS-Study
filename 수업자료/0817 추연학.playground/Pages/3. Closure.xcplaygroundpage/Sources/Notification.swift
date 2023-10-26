import Foundation

public class MyNotofication {
    public var callAction: (() -> ())? = nil
    public var cancelAction: (() -> ())? = nil
    public init() { }
    
    public var callCount: Int = 0
    
    public func call() {
        callCount += 1
        if callCount == 5 {
            print("부재중 5건")
        } else {
            callAction?()
        }
    }
    public func cancel() {
        callCount -= 1
        cancelAction?()
    }
}
