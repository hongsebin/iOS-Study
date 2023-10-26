/*:
 # Chapter 1
 ## Safe (안전성)
 */
/*:
 - optional
 - error Handling
 - type Control
 */
/*:
 ## optional
*/

import Foundation

let name: String = "연학"
let optinalName: String? = "연학"

var age: Int = 27
var optinalAge: Int? = 27

print(name + "\n\(optinalName)")
print("\(age)\n\(optinalAge)")

// 2년 후가 지났음
// afterTwoYears
age += 2
print(age)

//optinalAge += 2
//print(optinalAge)

Unwrapper.unwrap(to: optinalAge, base: 0, type: .forceUnwrapping)
Unwrapper.unwrap(to: optinalAge, base: 0, type: .guard)
Unwrapper.unwrap(to: optinalAge, base: 0, type: .ifLet)
Unwrapper.unwrap(to: optinalAge, base: 0, type: .operator)

// 전산 오류로 인한 age가 nil이 되었다. optinalAge == nil
optinalAge = nil

//Unwrapper.unwrap(to: optinalAge, base: 0, type: .forceUnwrapping)
//Unwrapper.unwrap(to: optinalAge, base: 0, type: .guard)
//Unwrapper.unwrap(to: optinalAge, base: 0, type: .ifLet)
//Unwrapper.unwrap(to: optinalAge, base: 0, type: .operator)

/*:
 ## error Handling
*/

Platform.join(id: "short", pw: "password")
Platform.join(id: "longlong", pw: "123123")
//Platform.join(id: "admin", pw: "password")
//Platform.fastJoin(id: "wow", pw: "1212")


/*:
 ## type Control
*/

/*:
 ### 타입 안전성(Type Safety)
 - 실수 방지, 코드의 안정성과 예측 가능성을 높여줍니다.
*/


//var inteager: Int = 100
//inteager = "I am a string"


/*:
 ### 타입 추론(Type Inference)
 - 변수나 상수를 선언할 때 항상 타입을 명시적으로 제공하지 않아도 됩니다.
 - 꼭 명시해야하는 것도 있음 ex) Dictinary, Array 등 Generic한 것들
*/

//var myString = 50
//print(type(of: myString))


/*:
 ### 타입 캐스팅(Type Casting)
 - 타입을 확인하거나 다른 클래스 계층구조로 변환할 수 있습니다..
*/

let pets: [Animal] = [Dog(), Cat(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        print("This pet is a dog")
    } else if let cat = pet as? Cat {
        print("This pet is a cat")
    }
}


/*:
 
 [Next](@next)

 The license for this document is available [here](Chuyeonhak).
 */
