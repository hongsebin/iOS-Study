//
//  UserDefaultEncoded.swift
//  ToDoLIstSampleProject
//
//  Created by ejsong on 2023/09/06.
//

import Foundation

/**
 기본 타입 (Int, Double, String)은 Userdefault 에 바로 적용 되지만
 struct 타입은 아카이빙을 통해 데이터 저장을 해야됨
 
 * 아카이빙 ?
   - 객체를 Data형과 같이 바이트 형태로 변경하는 작업
   - 저장 > struct 형태 >  Data 형 > 메모리에 저장
 
 -----------------------------------------------
-  JSON을 이용해 객체를 아카이빙 : 객체를 저장할 수 있는 Data 형태로 변환해 메모리 저장
 
 * PropertyWrapper 란?
   - 값이 있으면 한번 감싸서 저장을 위한 로직과 값을 불러오는 로직을 분리
 
 */
@propertyWrapper struct UserDefaultEncoded<T: Codable> {
    private let key: String
    private let defaultValue: T

    init(key: String, default: T) {
        self.key = key
        defaultValue = `default`
    }

    var wrappedValue: T {
        get {
            guard let jsonString = UserDefaults.standard.string(forKey: key) else { return defaultValue }
            
            guard let jsonData = jsonString.data(using: .utf8) else { return defaultValue }
            
            guard let value = try? JSONDecoder().decode(T.self, from: jsonData) else { return defaultValue }
            
            return value
        }
        set {
            let encoder = JSONEncoder()
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            guard let jsonData = try? encoder.encode(newValue) else { return }
            let jsonString = String(bytes: jsonData, encoding: .utf8)
            UserDefaults.standard.set(jsonString, forKey: key)
        }
    }
}
