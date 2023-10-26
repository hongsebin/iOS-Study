//
//  MainModel.swift
//  ToDoLIstSampleProject
//
//  Created by ejsong on 2023/09/05.
//

import Foundation

struct TodoList : Codable {
    var content: String            //내용
    var isCompleted: Bool = false //완료 여부
    
    init(content: String) {
        self.content = content
    }
}
