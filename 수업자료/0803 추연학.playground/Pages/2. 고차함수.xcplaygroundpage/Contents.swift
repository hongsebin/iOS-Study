/*:
 
 //: [Previous](@previous)
 
 # Chapter 2
 ## 고차함수
 */
/*:
 고차함수: 매개변수로 함수를 갖는 함수, Sequence, Collection 프로토콜을 채택 받아야함.
 * 스위프트는 함수를 일급 객체로 취급한다.
 - map
 - filter
 - reduce
 */
/*:
 ##: map -> 컨테이너를 다른 값으로 변형해서 추출
*/

import Foundation

let numbers = [1, 2, 3, 4, 5]
let doubledNumbers = numbers.map { $0 * 2 }
let anotherDoubledNumbers = numbers.map(double)

func double(number: Int) -> Int { number * 2 }

let studentss = MockUpdata.students
 let studentssname = studentss.map { $0.name }
// let studentNames = students.map(\.name)
// students.map { $0.
//zname + "입니다."}

/*:
 ## filter -> 컨테이너 내부의 값을 걸러서 추출
*/

let evenNumbers = numbers.filter { $0 % 2 == 0 }
let oddNumbers = numbers.filter(isOdd)

func isOdd(number: Int) -> Bool { number % 2 == 1 }

// plus + 5 and filter
numbers
    .map { $0 + 5 }
    .filter { $0 % 2 == 0 }

numbers
    .filter { $0 % 2 == 0 }
    .map { $0 + 5 }


/*:
 ## reduce -> 결합
 1. 각 요소를 전달받아 연산한 후 갑승ㄹ 다음 클로저를 실행을 위해 반환
 2. 컨테이너를 순환하며 클로저가 실행되지만 클로저가 따로 결괏값을 반환하지 않는 형태이다.
*/

//numbers.reduce(0, add)
//
//let ageAver = students.reduce(0.0) { $0 + Double($1.age) } / Double(students.count)
//
//let nameDictionary: [String: Int] = students.reduce(into: [:]) { dictionary, student in
//    let firstName = String(student.name.prefix(1))
//    dictionary[firstName] = (dictionary[firstName] ?? 0) + 1
//}
//
//numbers.reduce(into: []) { $0.append($1 * 2) }
//
//func add(num1: Int, num2: Int) -> Int { return num1 + num2}




public struct Student {
    public let name: String
    public let age: Int
    public let gender: Gender
}

public class MockUpdata {
    public static let students: [Student] = [Student(name: "John", age: 20, gender: .male),
                                             Student(name: "Jane", age: 22, gender: .female),
                                             Student(name: "Bob", age: 21, gender: .male),
                                             Student(name: "Anna", age: 22, gender: .female)]
}

public enum Gender {
    case male
    case female
    case unknown
}


// 여자인 사람 출력해주세요.
let girls = MockUpdata.students.filter { girl in
    girl.gender == .female
}
for girl in girls {
    print("Name = \(girl.name), age = \(girl.age), gender = \(girl.gender)")
}

// 여자이고, 21살인사람 출력해주세요.
let qq = MockUpdata.students.filter{ q in
    q.gender == .female && q.age == 22
}
for q in qq {
    print("여자 21살 이하: \(q.name)")
}


var name: String = "sebin"
print("\(name) 입니다")

func introduce (name: String) -> Void {
    print("\(name) 입니다")
}
introduce(name: name)

var number = 0
for num in 0...10 {
    if num % 2 == 0 {
        number += num
    }
}
print(number)

var temparr: [Int] = []
temparr.append(10)
temparr[0]
print((temparr.first ?? 0) + 10)

if let first = temparr.first {
    print(first + 10)
}

func getfirst() {
    print(temparr.first)
    
    guard let first = temparr.first else { return }
    print("hello", first)
}

//temparr.remove(at: 0)
temparr.append(contentsOf: [20, 30])

let myIndex = temparr.firstIndex(of: 20)
temparr.firstIndex { $0 == 20 }

//temparr[myIndex ?? 0] = 50

if let myIndex = temparr.firstIndex(of: 20) {
    temparr[myIndex] = 50
}

//temparr[myIndex!] = 50
print(temparr)

//for i in temparr {
//    print("i == ",i)
//    switch i {
//    case _:
//        if i % 2 == 0 {
//            print("짝수입니다")
//        }
//    case 10 : print(1)
//    case 30 : print(3)
//    case 50 : print(5)
//    default : break
//    }
//}


for i in temparr {
    print("i == ",i)
    switch i {
    case _ where i % 2 == 0 : print("짝수")
    case 10 : print(1)
    case 30 : print(3)
    case 50 : print(5)
    default : break
    }
}








//getfirst()



//public class Unwrapper<T> {
//    public static func unwrap(to value: T?,
//                              base: T,
//                              type: UnwrapType) -> T {
//        switch type {
//        case .forceUnwrapping:
//            return value!
//            // 쓰지말기. 강제종료 될 수 있음
//
//        case .guard:
//            guard let value else { return base }
//            return value
//
//        case .ifLet:
//            if let value {
//                return value
//            } else {
//                return base
//            }
//
//        case .operator:
//            return value ?? base
//        }
//    }
//}


//temparr.remove(at: 0)


//var dic: [String: Int] = [:]
//dic.updateValue(10, forKey: "hello")
//dic["bye"] = 10
//
//print (dic["hello"])
//
//dic["world"] = 15
//print(dic["world"])
//








// 이름에 n이 들어가는 여자를 출력해주세요.
let nwomen = MockUpdata.students.filter{ woman in
    woman.gender == .female && woman.name.contains("n")
}
for woman in nwomen {
    print("이름에 n이 들어가는 여자의 이름: \(woman.name)")
}


let exnumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let numbersresult = exnumbers.filter{number in
    return number % 2 == 0
}
print(numbersresult)




/*:
 
 [Next](@next)

 The license for this document is available [here](Chuyeonhak).
 */


// numberq 배열 만들어서 *3-1한 새로운 배열 map사용
let numberq = [1, 2, 3]
let numberqqq = numberq.map {$0 * 3 - 1}


// 빈 배열에 값 넣기
var numberarray: [Int] = []

numberarray.append(1) // 값 한 개 넣기
numberarray.append(contentsOf: [2,3]) // 값 여러개 넣기
numberarray.insert(contentsOf: [9,8], at: 0) // 값 여러개를 특정 위치에 넣기
numberarray += [10, 11]


// 이름 변수에 저장, 이름 출력
var myname = "sebin"
print(myname)
// 이름 하나씩 반복문 출려
for n in myname {
    print(n)
}


// guard, if let 사용해보기
