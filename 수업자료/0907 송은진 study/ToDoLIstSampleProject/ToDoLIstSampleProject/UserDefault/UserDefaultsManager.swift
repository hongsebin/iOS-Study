//
//  UserDefaultsManager.swift
//  ToDoLIstSampleProject
//
//  Created by ejsong on 2023/09/05.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    @UserDefaultEncoded(key: "list", default: [])
    
    var list: [TodoList]
    
    func addList(_ model: TodoList) {
        list.append(model)
    }
    
    func editValue(_ index: Int) {
        if list.indices ~= index {
            list[index].isCompleted.toggle()
        }
    }
    
    func removeValue(_ index: Int) {
        if list.indices ~= index {
            list.remove(at: index)
        }
    }

}
