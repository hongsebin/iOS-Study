/*:
 # Chapter 1
 ## 클로저
 */
/*:
 클로저: 변수나 상수에 할당하거나, 인자로 전달할 수 있는 독립적인 코드 블록
 */

import Foundation

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

var reversedNames = names.sorted(by: { s1, s2 in
    return s1 > s2
})

var anotherSortedNames = names.sorted { $0 < $1 }

var sortedNames = names.sorted(by: <) // 연산자 함수

print(reversedNames)
print(sortedNames)

func backwards(first: String, second: String) -> Bool {
    print("\(first), \(second) 비교 중")
    return first > second
}

names.sorted(by: backwards)

/*
 이 클로저는 s1과 s2라는 두 개의 String을 입력으로 받아, Bool을 반환합니다.
 반환값은 s1이 s2보다 앞선 문자열인지 아닌지를 나타냅니다.
 이 클로저는 sorted(by:) 함수의 인자로 전달되어, 문자열 배열을 역순으로 정렬하는 데 사용됩니다.
 */

/*:
 탈출 클로저: 함수의 인자로 전달되는 클로저가 함수의 실행이 끝난 후에 실행되는 경우, 이 클로저를 탈출 클로저라고 합니다.
 */

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func performCompletions() {
    completionHandlers.forEach { $0() }
}

func testFunc() {
    print(names.sorted(by: <))
}

someFunctionWithEscapingClosure {
    print("Hello!")
}

someFunctionWithEscapingClosure {
    testFunc()
}

performCompletions()

/*:
 클로저의 예: 비동기
 */

func fetchData(completion: @escaping (Data?, Error?) -> Void) {
    let data: Data? = nil // 실제로는 네트워크에서 가져올 데이터
    let error: Error? = nil // 에러가 있다면
    
    completion(data, error)
}

fetchData { data, error in
    if let data {
        print("데이터가 있어요")
    } else if let error {
        print("error")
    } else {
        print("둘다 nil이 들어옴")
    }
}


/*:
 
 [Next](@next)

 The license for this document is available [here](Chuyeonhak).
 */
