/*:
 # Chapter 1
 ## Delegate 패턴
 */
/*:
 delegate: '위임하다'
 delegate 패턴은 특정 객체가 수행해야 하는 작업을 다른 객체에게 위임하는 디자인 패턴, iOS 개발에서는 이 패턴이 아주 자주 사용됩니다.
 - 분리 및 재사용: 기능을 개별 객체로 분리함으로써 재사용성을 높이고 코드의 유지 관리를 용이
 - 유연성: 동일한 델리게이터에 다양한 델리게이트를 연결하여 동작을 쉽게 변경 가능
 - 캡슐화: 델리게이터는 내부 동작 방식을 알 필요 없이 델리게이트에게만 작업을 요청
 */

import Foundation

let chuyeonhak = Person(name: "연학")
let someButton = Button()

someButton.delegate = chuyeonhak

someButton.tap()

class Test {
    var sumNum: Int = 0 {
        willSet {
            print("before", sumNum)
            print("after", newValue)
        }
        didSet {
            print("didSet", sumNum)
        }
    }
}

let test = Test()
test.sumNum = 10


/*:
 연학이라는 사람과 어떤 버튼 생성 후
 
 버튼의 위임자를 yeonhak으로 설정
 
 button이 눌리면 위임자에게 알림이 간다고 생각하면 편하다.
 
 버튼 내부 동작 방식을 알 필요 없음.
 */
 

let ggomi = Cat(name: "꼬미")

someButton.delegate = ggomi

someButton.tap()



/*:
 꼬미라는 고양이가 이 버튼의 위임자가 되었다.
 그 후 button이 탭되면 탭 되었다고 ggomi에게 알림이 간다.
 
 문제 1. 꼬미는 버튼이 눌릴때마다 깜짝 놀란다.
 print("meow")해주세요.
 
 문제 2. 사람 클래스에서 money라는 변수를 만들고 0으로 초기화한다.
 버튼을 누를 때마다 += 100씩 해주세요.
 10번 탭한 후 돈을 프린트 해주세요.
 
 문제 3. Phone 클래스를 만드세요.
 폰의 위임자를 설정한 후 폰이 울리면
 폰에서 위임자에게 스팸메세지를 넘겨주세요.
 위임자는 그 메세지를 print 합니다.
 */


let sebin = Person(name: "sebin")
someButton.delegate = sebin
someButton.tap()


let phone = Phone()
let hong = Person(name: "hong")
phone.delegate = hong
phone.ring()

let calendar = Calendar()
let hongsebin = Person(name: "hongsebin")
calendar.delegate = hongsebin
calendar.notice()

/*:
 프로토콜 의존성 주입 (Protocol Dependency Injection)은 특정 구체 클래스에 의존하는 대신에 프로토콜에 의존하게 만드는 기술
 - 테스트 용이성: 모의 객체나 가짜 객체를 쉽게 주입하여 단위 테스트를 수행할 수 있습니다.
 - 코드 유연성: 다양한 구현을 교체하기 쉽습니다.
 - 코드의 재사용성: 동일한 프로토콜을 사용하는 다양한 구현을 생성할 수 있습니다.

 */


func test(test: String) {
    print("테스트중입니다. \(test)")
}
test(test: "dd")


/*:
 
 [Next](@next)

 The license for this document is available [here](Chuyeonhak).
 */
