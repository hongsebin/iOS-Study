import Foundation

public class ColdBrew: Coffee {
    public let name = "ColdBrew"
    public private(set) var cost: Int = 2500
    public let caffeineContent: Double = 212.0
    public var isHot: Bool = false
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
        cost += 200
    }
}
