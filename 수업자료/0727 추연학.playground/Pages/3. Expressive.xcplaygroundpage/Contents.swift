//: [Previous](@previous)

/*:
 # Expressive
 */
/*:
 - 함수는 깔끔하게 정의되며, 매개변수와 반환 타입이 명확합니다.
 */
func greet(to person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}

greet(to: "Yeonhak", day: "Tuesday")

/*:
 - 배열과 사전은 간결하게 정의하고 사용할 수 있습니다.
 */


var shoppingList = ["catfish", "water", "lemons"]
shoppingList.append("blue paint")
print(shoppingList)

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]

occupations["Jayne"] = "Public Relations"
print(occupations)
/*:
 [swift-style-guide](https://github.com/kodecocodes/swift-style-guide)
 */

/*:
 
 [Next](@next)

 The license for this document is available [here](Chuyeonhak).
 */
