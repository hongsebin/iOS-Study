import Foundation

//public class Phone {
//    public weak var delegate: PhoneDelegate? {
//        willSet {
//            if delegate == nil {
//                print("\(newValue!)이 위임했습니다.")
//            } else {
//                print("위임자가 [\(delegate!)]에서 [\(newValue!)]로 바뀌었습니다.")
//            }
//        }
//        didSet {
//            print("현재 위임자 == ", [delegate!])
//        }
//    }
//
//    public func ring() {
//        let message = "스팸"
//        delegate?.ringPhone(message: message)
//
//        print()
//    }
//
//    public init() { }
//
//}

public class Phone {
    public weak var delegate: PhoneDelegate?
    
    public func ring() {
        delegate?.didRing(message: "스팸메세지")
    }
    public init() {}
}
