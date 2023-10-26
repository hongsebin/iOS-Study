import Foundation

public class Character {
    private(set) var health: Int
    public let attack: Int = .random(in: 10...20)
    let name: String

    init(name: String, health: Int) {
        self.name = name
        self.health = health
    }
    
    public func move() {
        print("\(name) is moving...")
    }
    
    public func takeDamage(damage: Int) {
        health -= damage
        print("\(name) took \(damage) points of damage.")
    }
    
    func getHealth() -> Int {
        return health
    }
    
    func setHealth(health: Int) {
        self.health = health
    }
}
