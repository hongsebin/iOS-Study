//: [Previous](@previous)

/*:
 # Chapter 2
 ## Fast(신속성)
 */
/*:
 ### 타입 추론
 
 1.Swift의 강력한 타입 시스템은 런타임 에러를 줄이며, 이로 인해 성능 향상이 이루어집니다.
 - 컴파일러는 타입 검사를 통해 여러 오류를 미리 잡아내어 런타임 시의 오버헤드를 줄입니다.
 
 ### ARC
 
 2. ARC (Automatic Reference Counting)
  - 런타임 시의 가비지 컬렉션 오버헤드를 줄이고, 메모리 누수를 방지하여 성능을 향상시킵니다.
 
 ### Value Type
 
 3. Value Types(값 타입): 참조보다는 복사를 사용하여 데이터를 다루게 되므로, 멀티쓰레드 환경에서 데이터 충돌을 방지할 수 있습니다.
 - value Type은 스택 메모리에 저장됩니다.
 - 스택 메모리는 힙 메모리에 비해 더 빠른 접근 속도를 제공하므로, 이를 통해 성능이 향상됩니다.
 - 메모리 할당과 해제에 대한 오버헤드가 줄어들며, 이는 또한 성능 향상을 가져옵니다.
 - 인스턴스는 값이 복사되어 전달되므로, 멀티스레딩 환경에서도 데이터 충돌 문제를 줄일 수 있습니다.
 - 각 스레드는 자신만의 데이터 복사본을 사용하므로, 다른 스레드가 동일한 데이터를 변경하는 것에 대한 걱정 없이 데이터를 안전하게 다룰 수 있습니다.
 
 [documentation](https://developer.apple.com/documentation/swift/int)
 
 */
/*:
 
 [Next](@next)

 The license for this document is available [here](Chuyeonhak).
 */
