import Foundation

public class Cat {
    private let name: String
    
    public init(name: String) {
        self.name = name
    }
}

extension Cat: ButtonDelegate {
    public func didTapButton() {
//        print("\(name)(이)는 실수로 버튼을 눌렀습니다.")
        print("meow")
    }
}

extension Cat: CustomStringConvertible {
    public var description: String {
        "고양이: \(name)"
    }
}
