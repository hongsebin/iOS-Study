import Foundation

public class NetworkManager {
    public typealias Result = Bool
    public init() { }
    
    public func saveData(completion: (Result) -> ()) {
        let isSuccess = Int.random(in: 0...1) == 1
        
        completion(isSuccess)
    }
    
    public func fetchData(completion: @escaping (NetworkData) -> ()) {
        let data = ["수", "고", "했", "어", "요"]
        let networkData = NetworkData(code: 0, data: data)
        
        print("data를 가져오는 중입니다.")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(networkData)
        }
    }
    
    
}

public struct NetworkData {
    public let code: Int
    public let data: [String]
}
