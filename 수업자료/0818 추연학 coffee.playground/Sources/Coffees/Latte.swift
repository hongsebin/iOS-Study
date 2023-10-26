import Foundation

public class Latte: Coffee {
    public let name = "Latte"
    public let cost: Int = 3500
    public let caffeineContent: Double = 154.0
    public var isHot: Bool = true
    public var personalOptions: [PersonalOption] = []
    
    public init() { }
    
    public init(personalOptions: [PersonalOption]) {
        self.personalOptions = personalOptions
    }
    
    public func serve() {
        let temperature: String = isHot ? "hot": "iced"
        print(name + " is served " + temperature)
    }
    
    public func drink() {
        print("\(name)을 마십니다.")
    }
}
