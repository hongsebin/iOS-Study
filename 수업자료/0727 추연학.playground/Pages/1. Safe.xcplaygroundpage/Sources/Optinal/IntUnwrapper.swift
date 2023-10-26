import Foundation

public class Unwrapper<T> {
    public static func unwrap(to value: T?,
                              base: T,
                              type: UnwrapType) -> T {
        switch type {
        case .forceUnwrapping:
            return value!
            // 쓰지말기. 강제종료 될 수 있음
            
        case .guard:
            guard let value else { return base }
            return value
            
        case .ifLet:
            if let value {
                return value
            } else {
                return base
            }
            
        case .operator:
            return value ?? base
        }
    }
}
