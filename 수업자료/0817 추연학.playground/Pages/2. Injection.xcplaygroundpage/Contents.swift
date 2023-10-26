/*:
 
 [Previous](@previous)
 
 # Chapter 2
 ## Injection
 */
/*:
 의존성 주입(Dependency Injection, DI)은 객체가 다른 객체에 의존할 때,
 그 의존성을 외부에서 제공하는 디자인 패턴입니다.
 
 의존성 주입의 주요 목적은 코드의 결합도를 낮추고 재사용성과 테스트 용이성을 향상시키는 것입니다.
 */
/*:
 ##: 성자 주입(Constructor Injection)
 객체를 생성할 때 생성자를 통해 의존성을 주입합니다.
 일반적으로 가장 많이 사용되는 방식입니다.
*/

import Foundation

let engine = Engine()

let car = Car(engine: engine)

car.start()



/*:
 ## 속성 주입(Property Injection)
 객체가 생성된 후, 해당 객체의 공개된 속성을 통해 의존성을 주입합니다.
 항상 값이 필요하지 않은 경우에 사용될 수 있습니다.
*/

let airplane = Airplane()

airplane.engine = engine
airplane.start()


/*:
 ## 메서드 주입(Method Injection)
 특정 메서드를 통해 의존성을 주입합니다.
 주입이 한 번이나 몇 번 필요한 경우에 사용될 수 있습니다.
*/

let ktx = KTX()
ktx.start(engine: engine)


/*:
 현재는 모든 엔진이 같다고 생각하여 엔진을 넣었지만 어떻게 차와 비행기와 ktx의 엔진이 같을까요?
 하물며 차도 전기차, 하이브리드 종류가 있습니다.
 그럼 차 엔진, 비행기 엔진 따로 만들어야할까요?
*/

/*:
 ## 프로토콜을 사용하여 의존성 주입
 주입이 한 번이나 몇 번 필요한 경우에 사용될 수 있습니다.
*/

let electricEngine = ElectricEngine()
let teslaModelY = MyCar(engine: electricEngine)
teslaModelY.startEngine()

let gasolineEngine = GasolineEngine()
let genesisGv80 = MyCar(engine: gasolineEngine)
genesisGv80.startEngine()

/*:
 
 [Next](@next)

 The license for this document is available [here](Chuyeonhak).
 */

