//
//  ViewController+Delegate.swift
//  ToDoLIstSampleProject
//
//  Created by ejsong on 2023/09/05.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
//        return UserDefaultsManager.shared.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListCell.identifier) as? TodoListCell else { return UITableViewCell() }
        
        let list = UserDefaultsManager.shared.list[indexPath.row]
        cell.index = indexPath.row
        cell.setUI(list)
        cell.delegate = self
        return cell
    }
    
    /* 테이블 뷰 스와이프 삭제 */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            UserDefaultsManager.shared.removeValue(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}

extension ViewController: RegigsterDelegate , TodoListCellDelegate{
    func didTapRegister(_ text: String) {
        let model = TodoList(content: text)
        UserDefaultsManager.shared.addList(model)
        tableView.reloadData()
    }
    
    func didTapCheckBtn(_ index: Int) {
        UserDefaultsManager.shared.editValue(index)
    }
    
}


