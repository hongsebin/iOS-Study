/*:
 # Chapter 1
 ## OOP 게임
 */
/*:
 Player:
 Monster:
 */

import Foundation

let player = Player(name: "심상갑", health: 50, healingPower: 10)
let monster = Monster(name: "추연학", health: 120)

player.move()
monster.move()

player.takeDamage(damage: monster.attack)
player.heal()

monster.takeDamage(damage: player.attack)

/*:
 
 [Next](@next)

 The license for this document is available [here](Chuyeonhak).
 */
