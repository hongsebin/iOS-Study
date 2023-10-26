//: [Previous](@previous)

/*:
 # Chapter 3
 ## Closure
 */

/*:
 컴플리션 핸들러는 어떤 작업이 완료되었을 때 호출되는 콜백 또는 끝난 후에 실행되는 코드 블럭
 이를 통해 해당 작업의 결과나 완료 상태를 받아 처리할 수 있다.
 */

import Foundation

let networkManager = NetworkManager()

networkManager.saveData { isSuccess in
    let message = isSuccess ? "성공": "실패"
    
    print(message + "입니다.")
}


//networkManager.saveData { result in
//    print(result)
//}
//
//
//networkManager.fetchData { print($0.data.joined()) }

public func greet(completion: () -> ()) {
    print("안녕하세요")
    completion()
}

let testPrint = {
    print("밥먹으러갈래")
}

greet(completion: testPrint)

print(type(of: testPrint))
/*:
 컴플리션 핸들러는 어떤 작업이 완료되었을 때 호출되는 콜백 또는 끝난 후에 실행되는 코드 블럭
 이를 통해 해당 작업의 결과나 완료 상태를 받아 처리할 수 있다.
 */

let noti = MyNotofication()

noti.callAction = { print("전화가 왔습니다.") }
noti.cancelAction = { print("전화를 끊었습니다.") }

noti.call()
noti.call()
noti.call()
noti.call()
noti.call()

noti.cancel()


/*:
 
 [Next](@next)

 The license for this document is available [here](Chuyeonhak).
 */
