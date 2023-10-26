//
//  Model.swift
//  Memo
//
//  Created by yeoboya3 on 2023/09/15.
//

import Foundation

class Memo {
    // 메모 내용 저장
    var content: String
    
    // 메모 생성 날짜 저장
    var insertDate: Date
    
    // 생성자 - 클래스, 인스턴스를 초기화하는 역할
    init(content: String) {
        self.content = content
        insertDate = Date()
    }
    
    // 더미데이터 배열
    static var dummyMemoList = [
        Memo(content: "Lorem Ipsum"),
        Memo(content: "Dolar Amet")
    ]
}
