import Foundation

public protocol ButtonDelegate: AnyObject {
    func didTapButton()
}

public protocol PhoneDelegate: AnyObject {
    func didRing(message: String)
}

public protocol CalDelegate: AnyObject {
    func didNotice(with: Present)
}

public struct Present {
    let name: String
    let price: Int
}
