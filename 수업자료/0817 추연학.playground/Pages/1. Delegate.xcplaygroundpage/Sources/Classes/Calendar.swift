import Foundation

public class Calendar {
    public weak var delegate: CalDelegate?
    
    let present = Present(name: "선물", price: 50000)
    
    public func notice() {
        delegate?.didNotice(with: present)
    }
    public init() {}
}
