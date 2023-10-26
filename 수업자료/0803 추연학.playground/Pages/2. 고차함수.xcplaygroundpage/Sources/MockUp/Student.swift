import Foundation

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
