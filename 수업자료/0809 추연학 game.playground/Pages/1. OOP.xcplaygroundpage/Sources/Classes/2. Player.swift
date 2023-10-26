import Foundation

public class Player: Character {
    private var healingPower: Int
    private let defense: Int = .random(in: 5...10)
    
    public init(name: String, health: Int, healingPower: Int) {
        self.healingPower = healingPower
        
        super.init(name: name, health: health)
    }
    
    public override func takeDamage(damage: Int) {
        let trueDamage = damage - defense
        super.takeDamage(damage: trueDamage)
        print("\(name) defended by \(defense)")
        if getHealth() < 0 {
            print("\(name) has been defeated.")
        }
    }
    
    public func heal() {
        let newHealth = getHealth() + healingPower
        
        setHealth(health: newHealth)
        print("\(name) healed, health is now \(newHealth).")
    }
    
    override func setHealth(health: Int) {
        super.setHealth(health: health)
    }
}
