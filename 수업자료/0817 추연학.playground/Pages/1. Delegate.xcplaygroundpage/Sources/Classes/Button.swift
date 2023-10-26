import Foundation

public class Button {
    public weak var delegate: ButtonDelegate? {
        willSet {
            if delegate == nil {
                print("\(newValue!)이 위임했습니다.")
            } else {
                print("위임자가 [\(delegate!)]에서 [\(newValue!)]로 바뀌었습니다.")
            }
        }
        didSet {
            print("현재 위임자 == ", [delegate!])
        }
    }
    
    public func tap() {
        delegate?.didTapButton()
        print()
    }
    
    public init() { }
}
