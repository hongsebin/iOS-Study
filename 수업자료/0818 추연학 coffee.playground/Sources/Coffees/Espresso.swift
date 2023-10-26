import Foundation

public class Espresso: Coffee {
    public var cost: Int = 3000
    public let name = "Espresso"
    public let caffeineContent: Double = 212.0
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
