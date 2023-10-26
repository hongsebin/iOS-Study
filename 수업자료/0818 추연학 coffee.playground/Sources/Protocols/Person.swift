import Foundation

public protocol Person {
    associatedtype State
    
    var name: String { get }
    var state: State? { get set }
}
